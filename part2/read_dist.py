#!/usr/bin/env python
import gzip
import matplotlib.pyplot as plt
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="Specifying files to plot read length distributions.")
    parser.add_argument("-r1", "--read1", help="Specify the read1 filename")
    parser.add_argument("-r2", "--read2", help="Specify the read2 filename")
    parser.add_argument("-t", "--title", help="Specify the read2 filename")
    parser.add_argument("-o", "--output", help="Specify the output filename")
    return parser.parse_args()

args = get_args()

read1_counts = []
read2_counts = []

with gzip.open(args.read1, "rt") as r1:
    r1_line_count = 0 
    for line in r1:
        line = line.strip('\n')
        r1_line_count += 1
        if r1_line_count % 4 == 2:
            r1_read_count = 0 
            for i in line:
                r1_read_count += 1
            read1_counts.append(r1_read_count)

with gzip.open(args.read2, "rt") as r2:
    r2_line_count = 0 
    for line in r2:
        line = line.strip('\n')
        r2_line_count += 1
        if r2_line_count % 4 == 2:
            r2_read_count = 0 
            for i in line:
                r2_read_count += 1
            read2_counts.append(r2_read_count)

plt.hist([read1_counts,read2_counts], label=['read1','read2'])
plt.legend(loc='upper left')
plt.yscale('log')
plt.title(args.title + "Read Length Distributions")
plt.savefig(args.output)