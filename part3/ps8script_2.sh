#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=STAR2          ### Job Name
#SBATCH --output=result-%j.out  ### File in which to store job output
#SBATCH --error=result-%j.err   ### File in which to store job error messages
#SBATCH --time=0-01:00:00       ### Wall clock time limit in Days-HH:MM:SS
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=8       ### Number of CPUs
#SBATCH --ntasks-per-node=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp          ### Account used for job submission

#r1='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part2/1_2A_read1_forward_paired.fq.gz'
#r2='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part2/1_2A_read2_reverse_paired.fq.gz'
r1='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part2/24_4A_read1_forward_paired.fq.gz'
r2='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part2/24_4A_read2_reverse_paired.fq.gz'
gtf='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part3/Mus_musculus.GRCm39.107.gtf'
fa='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part3/Mus_musculus.GRCm39.dna.primary_assembly.fa'
gdir='/gpfs/projects/bgmp/justinem/bioinfo/Bi622/QAA/markdown_files/part3/star_output'

conda activate bgmp_py310

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn $r1 $r2 \
--genomeDir $gdir \
--outFileNamePrefix result