#!/usr/bin/env python 

import sys
import os
import math
import numpy
from datetime import datetime
from decimal import Decimal
from scipy.integrate import quad
from pylab import *


AREPO_NAME = 'arepo'
RAMSES_NAME = 'ramses'
SPHNG_NAME = 'sphng'

# the standard deviation limit is expressed
# as a percentage of the mean
STD_DEV_LIMIT = 1.0

debug = 0


def update_running_stat_dict(rsDict, x):
  n = rsDict['n']
  min = rsDict['min']
  max = rsDict['max']
  m = rsDict['m']

  n1 = n
  t = [0.0, 0.0, 0.0, 0.0]

  n += 1.0;

  if 1.0 < n:
    if x < min: min = x
    if x > max: max = x
  else:
    min = max = x
    
  t[0] = x - m[0]
  t[1] = t[0] / n
  t[2] = t[1] * t[1]
  t[3] = t[0] * t[1] * n1

  m[0] += t[1]
  m[3] += t[3]*t[2]*(n*n - 3.0*n + 3.0) + 6.0*t[2]*m[1] - 4.0*t[1]*m[2]
  m[2] += t[3]*t[1]*(n-2.0) - 3.0*t[1]*m[1]
  m[1] += t[3]
  
  rsDict['n'] = n
  rsDict['min'] = min
  rsDict['max'] = max
  rsDict['m'] = m

def get_count(rsDict):
  return int(rsDict['n'])

def get_mean(rsDict):
  return rsDict['m'][0]

def get_stddev(rsDict):
  n = rsDict['n']
  m = rsDict['m']
  return math.sqrt(m[1]/(n-1.0) if n > 1.0 else 0.0)

def get_width(rsDict):
  mean = abs(get_mean(rsDict))
  stdev = get_stddev(rsDict)
  return stdev/mean*100.0 

def get_skewness(rsDict):
  n = rsDict['n']
  m = rsDict['m']
  return math.sqrt(n)*m[2]/math.pow(m[1],1.5) if 0.0 != m[1] else 0.0

def get_kurtosis(rsDict): 
  n = rsDict['n']
  m = rsDict['m']
  return (n*m[3])/(m[1]*m[1]) - 3.0 if 0.0 != m[1] else 0.0

def is_stddev_within_limit(rsDict):
  mean = abs(get_mean(rsDict))
  stddev = get_stddev(rsDict)
  width = stddev/mean*100.0
  return width <= STD_DEV_LIMIT

def serialise_running_stat_dict(rsDict):
  cnt = get_count(rsDict)
  mean = get_mean(rsDict)
  stddev = get_stddev(rsDict)
  min = rsDict['min']
  max = rsDict['max']
  width = get_width(rsDict)
  skew = get_skewness(rsDict)
  kurt = get_kurtosis(rsDict)

  rsStr = str(cnt) + ' '
  rsStr += '%.3E' % Decimal(mean) + ' '
  rsStr += '%.3E' % Decimal(stddev) + ' '
  rsStr += str(round(width,2)) + '% '
  rsStr += '[' + '%.3E' % Decimal(min) + ','
  rsStr += '%.3E' % Decimal(max) + '] '
  rsStr += '%.3E' % Decimal(skew) + ' '
  rsStr += '%.3E' % Decimal(kurt)

  return rsStr


def print_performance_summary(results):
  for k in sorted(results.keys()):
    prefix = ''

    if 0 < len(results[k]):
      rs = results[k][0]
      prefix += str(rs['nodes'])
      if 'processes' in rs: prefix += ' ' + str(rs['processes'])
      if 'threads' in rs: prefix += ' ' +str(rs['threads'])

    rtStats = { 'n': 0.0, 'min': 0.0, 'max': 0.0, 'm': [0.0,0.0,0.0,0.0] }
    pfStats = { 'n': 0.0, 'min': 0.0, 'max': 0.0, 'm': [0.0,0.0,0.0,0.0] }
    worst = { 'runtime':  -1.0, 'performance': -1.0 }

    for rs in results[k]:
      if worst['runtime'] < rs['runtime']:
        worst['runtime'] = rs['runtime']
        worst['performance'] = rs['performance']
      
      update_running_stat_dict(rtStats, rs['runtime'])
      update_running_stat_dict(pfStats, rs['performance'])

    if -1 == debug:
      prefix += ' ' + str(get_count(rtStats))
      if is_stddev_within_limit(rtStats):
        prefix += ' 1'
        rtStr = '%.3E' % Decimal(get_mean(rtStats))
        pfStr = '%.3E' % Decimal(get_mean(pfStats))
      else:
        # if standard deviation greater than <STD_DEV_LIMIT>% of mean then
        # print worst performance measure (i.e., longest runtime)
        prefix += ' 0'
        rtStr = '%.3E' % Decimal(worst['runtime'])
        pfStr = '%.3E' % Decimal(worst['performance'])
    else:
      rtStr = serialise_running_stat_dict(rtStats)
      pfStr = serialise_running_stat_dict(pfStats)

    print(prefix+' '+rtStr+' '+pfStr)


def get_arepo_metric(outFilenames):
  if 0 < debug: print('Extracting Arepo performance metric(s)...')

  def calc_age_integral(z):
    OMEGA0 = 0.2726
    OMEGA_LAMBDA = 0.7274
    ez = sqrt(OMEGA_LAMBDA + (1.0 - OMEGA0 - OMEGA_LAMBDA)*(1.0+z)**2.0 + OMEGA0*(1.0+z)**3.0)
    return 1.0/(1.0+z)/ez

  def calc_age(a):
    HUBBLE_PARAM = 0.704 * 100.0
    SECONDS_PER_YEAR = 3.1536e7
    tz = quad(calc_age_integral, 1.0/a - 1.0, numpy.inf)[0]
    return (tz/HUBBLE_PARAM * 3.085677581e24/1.0e5) / SECONDS_PER_YEAR

  results = {}
  for outfn in outFilenames:
    if 0 < debug: print('Reading '+outfn+'...')
    lfs_i = outfn.rindex('/')
    pfs_i = outfn[:lfs_i].rindex('/')
    outLabel = outfn[pfs_i+1:lfs_i]
    nn = -1
    if 'n' in outLabel:
      nn = int(outLabel[1:])
    outKey = nn
    outData = os.popen('cat ' + outfn).read()
    outLines = outData.split('\n')
    firstSyncPointSet = False
    runTimeFound = False
    for ln in outLines:
      lnParts = ln.split()
      if 'Sync-Point ' in ln:
        scaleFactor = float(lnParts[3][:lnParts[3].index(',')])
        if not firstSyncPointSet:
          firstSyncPointSet = True
          startSimTime = calc_age(scaleFactor)
      elif 'Code run for ' in ln:
        runTimeFound = True
        runTime = float(lnParts[3])
    if not firstSyncPointSet or not runTimeFound:
      # this run was not successful
      continue
    simTime = calc_age(scaleFactor) - startSimTime
    if 0 < debug:
      print('         runtime = '+str(runTime)+' s')
      print('         simtime = '+str(simTime)+' yr')
      print('     performance = '+str(simTime/runTime)+' simulation years per second')
    if outKey not in results: results[outKey] = []
    results[outKey].append({ 'runtime': int(round(runTime)), 'performance': simTime/runTime })
    results[outKey][-1]['nodes'] = nn

  print_performance_summary(results)


def get_ramses_metric(outFilenames):
  if 0 < debug: print('Extracting Ramses performance metric(s)...')
  results = {}
  for outfn in outFilenames:
    if 0 < debug: print('Reading '+outfn+'...')
    lfs_i = outfn.rindex('/')
    pfs_i = outfn[:lfs_i].rindex('/')
    outLabel = outfn[pfs_i+1:lfs_i]
    nn = -1
    if 'n' in outLabel:
      nn = int(outLabel[1:])
    outKey = nn
    outData = os.popen('cat ' + outfn).read()
    outLines = outData.split('\n')
    firstSimStepSet = False
    for ln in outLines:
      lnParts = ln.split()
      if 'Main step= ' in ln:
        simStep = int(lnParts[2])
        if not firstSimStepSet:
          firstSimStep = simStep
          firstSimStepSet = True
      elif 'Total elapsed time: ' in ln:
        runTime = float(lnParts[3])
    if not firstSimStepSet:
      # this run was not successful
      continue
    simSteps = simStep - firstSimStep + 1
    if 0 < debug:
      print('         runtime = '+str(runTime)+' s')
      print('        simsteps = '+str(simSteps))
      print('     performance = '+str(runTime/simSteps)+' seconds per coarse time step')
    if outKey not in results: results[outKey] = []
    results[outKey].append({ 'runtime': int(round(runTime)), 'performance': runTime/simSteps })
    results[outKey][-1]['nodes'] = nn

  print_performance_summary(results)


def get_sphng_metric(outFilenames):
  if 0 < debug: print('Extracting sphNG performance metric(s)...')

  startCycle = int(sys.argv[4]) if 5<=len(sys.argv) else 2 
  endCycle = int(sys.argv[5]) if 6<=len(sys.argv) else 22

  runDict = {}
  for outfn in outFilenames:
    path = outfn[:outfn.rindex('/')]
    fn = outfn[outfn.rindex('/')+1:]
    if path in runDict:
      runDict[path].append(fn)
    else:
      runDict[path] = [fn]

  results = {}
  for runPath in runDict:
    for fn in runDict[runPath]:
      outfn = runPath+'/'+fn
      if 0 < debug: print('Reading '+outfn+'...')
      lfs_i = outfn.rindex('/')
      pfs_i = outfn[:lfs_i].rindex('/')
      outLabel = outfn[pfs_i+1:lfs_i]
      nn = -1
      if 'x' in outLabel:
        # this is a single node test
        nn = 1
        outKey = int(outLabel.split('x')[0]) 
      elif 'n' in outLabel:
        nn = int(outLabel[1:])
        outKey = nn
      outData = os.popen('cat ' + outfn).read()
      outLines = outData.split('\n')
      readTimes = False
      startRunTimeFound = False
      startSimTimeFound = False
      runningPerf = {}
      firstCycle = lastCycle = -1
      runTimeInc = simTimeInc = 0.0
      runTime = simTime = 0.0
      # zero the number of mpi processes (np) and the number of openmp threads (nt)
      # actual values should be recorded in test01
      np = nt = 0
      for ln in outLines:
        if 'MPI processes' in ln:
          np = int(ln.split()[2])
        elif 'openMP threads' in ln:
          nt = int(ln.split()[2])
        elif 'C Y C L E   N O' in ln:
          if debug > 1: print(ln)
          cycle = int(ln[ln.index(':')+1:ln.index('/')])
          if startCycle == cycle:
            firstCycle = cycle
            lastCycle = cycle
            readTimes = True
          elif endCycle < cycle:
            readTimes = False
          else:
            lastCycle = cycle
          continue
        else:
          if readTimes and 'RUNTIME  :  ' in ln:
            if debug > 1: print(ln)
            if startRunTimeFound:
              runTimeInc = float(ln.split()[2]) - runTime
              runTime = float(ln.split()[2]) - startRunTime
            else:
              startRunTime = float(ln.split()[2])
              startRunTimeFound = True
          elif readTimes and 'SIMTIME  :  ' in ln:
            if debug > 1: print(ln)
            if startSimTimeFound:
              simTimeInc = float(ln.split()[2]) - simTime
              simTime = float(ln.split()[2]) - startSimTime
            else:
              startSimTime = float(ln.split()[2])
              startSimTimeFound = True

          if 0.0 < runTimeInc and 0.0 < simTimeInc:
            runningPerf[cycle] = simTimeInc/runTimeInc
            runTimeInc = simTimeInc = 0.0
          
      if 0 < debug:
        print('first cycle = '+str(firstCycle))
        print(' last cycle = '+str(lastCycle))
        print('    runtime = '+str(runTime)+' s')
        print('    simtime = '+str(simTime))
        print('performance = '+str(simTime/runTime)+' simulation years per second')
        if 1 < debug:
          print('running performance...')
          pf = pfInc = 0.0
          for cycle in runningPerf:
            if 0.0 < pf:
              pfInc = (runningPerf[cycle]/pf - 1.0)*100.0
            pf = runningPerf[cycle]
            pfstr = '%.3E' % Decimal(pf)
            pfIncStr = str(round(pfInc,2))
            print('  cycle '+str(cycle)+': '+pfstr+' '+pfIncStr+'%')

      if outKey not in results: results[outKey] = []
      results[outKey].append({ 'runtime': int(round(runTime)), 'performance': simTime/runTime })
      results[outKey][-1]['nodes'] = nn
      results[outKey][-1]['processes'] = np
      results[outKey][-1]['threads'] = nt

  print_performance_summary(results)


codeName = sys.argv[1].lower()
outFilenameMask = sys.argv[2]
debug = int(sys.argv[3]) if 4<=len(sys.argv) else 0

outFilenameListing = os.popen('ls ' + outFilenameMask).read()
outFilenames = outFilenameListing.split()

if AREPO_NAME in codeName:
  get_arepo_metric(outFilenames)
elif RAMSES_NAME in codeName:
  get_ramses_metric(outFilenames)
elif SPHNG_NAME in codeName:
  get_sphng_metric(outFilenames)
else:
  print("Error, "+sys.argv[1]+" does not match recognised code name.")
