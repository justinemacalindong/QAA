#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=demux_plot     ### Job Name
#SBATCH --output=results-%j.out         ### File in which to store job output
#SBATCH --error=results-%j.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1

fdir="/projects/bgmp/shared/2017_sequencing/demultiplexed"

/usr/bin/time -v ./script_the_first.py -f $fdir/24_4A_control_S18_L008_R2_001.fastq.gz -r 101 -pn 24_4A_R2_demux_plot.png -pt 24_4A_control_S18_L008_R2_001.fastq.gz