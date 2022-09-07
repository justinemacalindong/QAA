#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=plot     ### Job Name
#SBATCH --output=results-%j.out         ### File in which to store job output
#SBATCH --error=results-%j.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1

/usr/bin/time -v ./read_dist.py -r1 1_2A_read1_forward_paired.fq.gz -r2 1_2A_read2_reverse_paired.fq.gz -t 1_2A_control_S1_L008 -o 1_2A
#/usr/bin/time -v ./read_dist.py -r1 24_4A_read1_forward_paired.fq.gz -r2 24_4A_read2_reverse_paired.fq.gz -t 24_4A_control_S18_L008 -o 24_4A.png