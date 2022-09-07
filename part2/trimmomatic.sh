#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=trim     ### Job Name
#SBATCH --output=results-%j.out         ### File in which to store job output
#SBATCH --error=results-%j.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1

conda activate QAA

#/usr/bin/time -v trimmomatic PE 1_2A_outR1.fastq 1_2A_outR2.fastq 1_2A_read1_forward_paired.fq.gz 1_2A_read1_forward_unpaired.fq.gz 1_2A_read2_reverse_paired.fq.gz 1_2A_read2_reverse_unpaired.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35
/usr/bin/time -v trimmomatic PE 24_4A_outR1.fastq 24_4A_outR2.fastq 24_4A_read1_forward_paired.fq.gz 24_4A_read1_forward_unpaired.fq.gz 24_4A_read2_reverse_paired.fq.gz 24_4A_read2_reverse_unpaired.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35