#!/bin/bash

THREADS=1 
IFD=''
READS=''
read -e -p 'Output base filename:' OUTPUT

hisat2 -p $THREADS --dta --time --rna-strandness RF -x $IFD -1 $READS/1.fastq.gz -2 $READS/1.fastq.gz | \
    samtools view -@ $THREADS -b | samtools sort -@ $THREADS -o ${OUTPUT}_sorted.bam 
