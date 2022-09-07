#!/usr/bin/env python

def get_args():
    parser = argparse.ArgumentParser(description="Specifying files to count mapped and unmapped reads.")
    parser.add_argument("-f", "--file", help="Specify the filename")
    parser.add_argument("-o", "--output", help="Specify the output filename")
    return parser.parse_args()

args = get_args()

total_mapped = 0
primary_mapped = 0
secondary_mapped = 0
total_unmapped = 0 
primary_unmapped = 0 
secondary_unmapped = 0
line_count = 0 

with open(args.file, "r") as sam:
    for line in sam:
        if not line.startswith("@"): # Do not include header lines
            line = line.split('\t') # Split by tab
            flag = int(line[1]) # Indexing for flag column
            line_count += 1
            if((flag & 4) != 4): # If flag is mapped
                total_mapped += 1
                if((flag & 256) != 256): # If flag is not a secondary alignment
                    primary_mapped += 1
                else: # If flag is a secondary alignment
                    secondary_mapped += 1
            else: # If flag is unmapped
                total_unmapped += 1
                if((flag & 256) != 256): # If flag is not a secondary alignment
                    primary_unmapped += 1
                else: # If flag is a secondary alignment
                    secondary_unmapped += 1


print("Total number of reads that are mapped:",total_mapped)
print("Number of primary reads that are mapped:", primary_mapped)
print("Number of secondary reads that are mapped:", secondary_mapped)
print("Total number of reads that are unmapped:",total_unmapped)
print("Number of primary reads that are unmapped:", primary_unmapped)
print("Number of secondary reads that are unmapped:", secondary_unmapped)
print("Total number of reads:", line_count)

output_file = open(args.output, "w")
output_file.write("Total number of reads that are mapped: " + str(total_mapped) + '\n')
output_file.write("Number of primary reads that are mapped: " + str(primary_mapped) + '\n')
output_file.write("Number of secondary reads that are mapped: " + str(secondary_mapped) + '\n')
output_file.write("Total number of reads that are unmapped: " + str(total_unmapped) + '\n')
output_file.write("Number of primary reads that are unmapped: " + str(primary_unmapped) + '\n')
output_file.write("Number of secondary reads that are unmapped: " + str(secondary_unmapped) + '\n')
output_file.write("Total number of reads: " + str(line_count) + '\n')
output_file.close()