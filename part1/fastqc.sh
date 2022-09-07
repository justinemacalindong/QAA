#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=fastqc     ### Job Name
#SBATCH --output=results-%j.out         ### File in which to store job output
#SBATCH --error=results-%j.err          ### File in which to store job error messages
#SBATCH --time=0-08:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=4
#SBATCH --nodes=1
#SBATCH --nodelist=n278   

fdir="/projects/bgmp/shared/2017_sequencing/demultiplexed"
odir="/projects/bgmp/justinem/bioinfo/Bi622/QAA/output_dir"

module load fastqc/0.11.5

# fastqc -t 2 $fdir/1_2A_control_S1_L008_R1_001.fastq.gz $fdir/1_2A_control_S1_L008_R2_001.fastq.gz -o $odir
fastqc -t 2 $fdir/24_4A_control_S18_L008_R1_001.fastq.gz $fdir/24_4A_control_S18_L008_R2_001.fastq.gz -o $odir


