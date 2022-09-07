#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=htseq          ### Job Name
#SBATCH --output=result-%j.out  ### File in which to store job output
#SBATCH --error=result-%j.err   ### File in which to store job error messages
#SBATCH --time=0-01:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8       ### Number of CPUs
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp          ### Account used for job submission

conda activate QAA

dir='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part3'

#/usr/bin/time -v htseq-count --stranded=yes $dir/1_2A/resultAligned.out.sam $dir/Mus_musculus.GRCm39.107.gtf
#/usr/bin/time -v htseq-count --stranded=reverse $dir/1_2A/resultAligned.out.sam $dir/Mus_musculus.GRCm39.107.gtf
#/usr/bin/time -v htseq-count --stranded=yes $dir/24_4A/resultAligned.out.sam $dir/Mus_musculus.GRCm39.107.gtf
/usr/bin/time -v htseq-count --stranded=reverse $dir/24_4A/resultAligned.out.sam $dir/Mus_musculus.GRCm39.107.gtf