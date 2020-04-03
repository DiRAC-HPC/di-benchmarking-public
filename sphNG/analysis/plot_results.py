#!/usr/bin/env python

# see ./generate_plots.sh for examples of how to call this script

import sys
import os
import math
from datetime import datetime
from decimal import Decimal
import matplotlib as mpl
from matplotlib import pyplot as plt
mpl.rcParams['figure.figsize'] = (12,6)
import seaborn as sns
sns.set(font_scale=1.5, context="paper", style="white", font="serif")
pal = sns.color_palette()
cols = pal.as_hex()

labels = {}
colours = {}
labels['cosma7'] = 'COSMA7 (2x Intel Skylake 5120, 2.2GHz, 14c)'
labels['tesseract'] = 'Tesseract (2x Intel Skylake 4116, 2.2GHz, 12c)'
colours['cosma7'] = cols[0]
colours['tesseract'] = cols[1]

clArgCnt = len(sys.argv)

resfn = sys.argv[1]
xi = int(sys.argv[2])
xl = sys.argv[3]
yi = int(sys.argv[4])
yl = sys.argv[5]
yf = float(sys.argv[6])
if 1.0 != yf:
  yf = yf/(3600*24*365)
tt = sys.argv[7]
pfn = sys.argv[8]
lw = float(sys.argv[9])
legpos = sys.argv[10]
inv = True if (12 == clArgCnt and '1' == sys.argv[11]) else False

resData = os.popen('cat ' + resfn).read()
resLines = resData.split('\n')

macName = ""
macAttrs = []
macResults = []
dictMacResults = {}
dictMacAttrs = {}

for ln in resLines:
  if 0 == len(ln):
    # empty line
    continue
  elif '#' == ln[0]:
    # comment line
    continue
  elif '!' == ln[0]:
    # new machine
    if 0 < len(macName):
      if 0 < len(macResults):
        dictMacAttrs[macName] = macAttrs
        dictMacResults[macName] = macResults
        macResults = []
    macName = ""
    macAttrs = []
    lnParts = ln[2:].split()
    macName = lnParts[0]
    for lnpt in lnParts[1:]:
      if '(' == lnpt[0]:
        attrList = lnpt[1:-1].split(',')
        for attr in attrList:
          macAttrs.append(float(attr))
      else:
        macName += ' '+lnpt
  else:
    # results for machine macName
    lnParts = ln.split()
    resList = []
    for lnpt in lnParts:
      resList.append(float(lnpt))
    macResults.append(resList)

if 0 < len(macResults):
  dictMacAttrs[macName] = macAttrs
  dictMacResults[macName] = macResults

fig = plt.gcf()

useCoreCount = True if 'core count' in xl.lower() else False

nodes = {}
perf = {}
for macName in dictMacResults:
  coresPerNode = dictMacAttrs[macName][0]
  memPerNode = dictMacAttrs[macName][1]
  xpts = []
  ypts = []
  for result in dictMacResults[macName]:
    xp = result[xi]*coresPerNode if useCoreCount else result[xi]
    yp = result[yi]*yf
    if inv: yp = 1.0/yp
    xpts.append(xp)
    ypts.append(yp)
  plt.plot(xpts, ypts, label=labels[macName], color=colours[macName], marker='+', alpha=0.6)
  nodes[macName] = xpts
  perf[macName] = ypts

plt.legend(loc=legpos)
plt.xlabel(xl)
plt.ylabel(yl)
# plt.title(tt)
sns.despine()
plt.show()

fig.savefig(pfn+'.png', dpi=300)

# Show single node performance
print("{:12s}{:>12s}{:>20s}".format("System", "Nodes", "Perf. (years/s)"))
for macName in dictMacResults:
  tnodes = nodes[macName]
  tperf = perf[macName]
  print("{:12s}{:12d}{:20.3f}".format(macName, int(tnodes[0]), tperf[0]))
