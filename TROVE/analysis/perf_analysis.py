import sys
import glob
import os
import numpy as np
import pandas as pd
import matplotlib as mpl
from matplotlib import pyplot as plt
mpl.rcParams['figure.figsize'] = (12,6)
import seaborn as sns
sns.set(font_scale=1.5, context="paper", style="white", font="serif")
pal = sns.color_palette()
cols = pal.as_hex()

def main():

    systems = ['cosma7','tesseract','dial','amd7402','amd7502','amd7702','oracle cloud']
    sysdetails = {}
    
    tempd = {}
    tempd['dir'] = '../results/COSMA7/i19/14N'
    tempd['cpn'] = 28
    tempd['label'] = 'COSMA7 (2x Intel Skylake 5120, 2.2GHz, 14c)'
    tempd['col'] = cols[0]
    sysdetails['cosma7'] = tempd.copy()
    tempd = {}
    tempd['dir'] = '../results/Tesseract/i19/14N'
    tempd['cpn'] = 24
    tempd['label'] = 'Tesseract (2x Intel Skylake 4116, 2.0GHz, 12c)'
    tempd['col'] = cols[1]
    sysdetails['tesseract'] = tempd.copy()
    tempd = {}
    tempd['dir'] = '../results/DiaL/i19/14N'
    tempd['cpn'] = 36
    tempd['label'] = 'DIaL (2x Intel Skylake 6140, 2.3GHz, 18c)'
    tempd['col'] = cols[2]
    sysdetails['dial'] = tempd.copy()

    nodes = {}
    perf = {}
    for system in systems:
        tempd = sysdetails[system]
        file_list = glob.glob(tempd['dir'] + "/*node/file1.*")

        protodf = []

        for file in file_list:
            rundict = parse_file(file, tempd['cpn'])
            protodf.append(rundict)

        df = pd.DataFrame(protodf)

        print()
        print(tempd['label'])
        nodes[system], perf[system] = get_perf_stats(df, 'max', writestats=True)
    
    for system in systems:
        tempd = sysdetails[system]
        plt.plot(nodes[system], perf[system], marker='+', color=tempd['col'], label=tempd['label'], alpha=0.6)
    plt.xlabel('Nodes')
    plt.ylabel('Performance (calc/s)')
    plt.xlim([0,33])
    plt.legend(loc='best')
    sns.despine()
    plt.savefig('trove_perf.png', dpi=300)

def parse_file(infile, cpn):

    rundetails = {}
    rundetails['File'] = infile

    filename = os.path.basename(infile)
    tokens = filename.split('.')
    rundetails['Nodes'] = int(tokens[2].split('-')[0])
    rundetails['Ranks'] = int(tokens[3].split('-')[0])
    rundetails['Threads'] = int(tokens[4].split('-')[0])

    # Read the file header
    f = open(infile, "r")
    for line in f:
        if "TROVE " in line:
            s = line.split()
            rundetails['Runtime'] = float(s[2])
    f.close()
    rundetails['Perf'] = 1.0 / rundetails['Runtime']

    if rundetails['Ranks'] == 0:
        rundetails['Ranks'] = 1
    else:
        rundetails['Ranks'] = 2 * rundetails['Ranks']
    rundetails['Cores'] = rundetails['Ranks'] * rundetails['Threads']
    # Sometimes ranks are ranks per socket and sometimes not. 
    # This quick hack is to fix this without renaming results files
    if rundetails['Cores'] > cpn:
        rundetails['Cores'] = int(rundetails['Cores'] / 2)
        if rundetails['Ranks'] > 1:
            rundetails['Ranks'] = int(rundetails['Ranks'] / 2)
    rundetails['Count'] = 1

    return rundetails

def get_perf_stats(df, stat, threads=None, writestats=False):
    if threads is not None:
       query = '(Threads == {0})'.format(threads)
       df = df.query(query)
    df_num = df.drop(['File'], 1)
    groupf = {'Perf':['min','median','max','mean'], 'Count':'sum'}
    df_group = df_num.sort_values(by='Nodes').groupby(['Nodes','Cores','Ranks','Threads']).agg(groupf)
    if writestats:
        print("All results:")
        print(df_group)
    # Reduce to nodes only so we get performance per node
    df_group = df_num.sort_values(by='Nodes').groupby(['Nodes']).agg(groupf)
    if writestats:
        print("By node:")
        print(df_group)
    perf = df_group['Perf',stat].tolist()
    nodes = df_group.index.get_level_values(0).tolist()
    return nodes, perf

main()
