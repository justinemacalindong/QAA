#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=cutadapt     ### Job Name
#SBATCH --output=results-%j.out         ### File in which to store job output
#SBATCH --error=results-%j.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1

fdir="/projects/bgmp/shared/2017_sequencing/demultiplexed"

conda activate QAA

#/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o 1_2A_outR1.fastq -p 1_2A_outR2.fastq $fdir/1_2A_control_S1_L008_R1_001.fastq.gz $fdir/1_2A_control_S1_L008_R2_001.fastq.gz
/usr/bin/time -v cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o 24_4A_outR1.fastq -p 24_4A_outR2.fastq $fdir/24_4A_control_S18_L008_R1_001.fastq.gz $fdir/24_4A_control_S18_L008_R2_001.fastq.gz