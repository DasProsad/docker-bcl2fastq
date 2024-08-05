#!/bin/bash

run_dir="/path/to/ngs/run/dir/"
out_dir="/path/to/output/dir"
sample_sheet="samplesheet.csv"
log_name="$(basename "$sample_sheet" .csv)"

sudo docker run \
-v "$run_dir":/mnt/run \
-v "$out_dir":/mnt/output \
zymoresearch/bcl2fastq \
--barcode-mismatches 1 \
--sample-sheet "/mnt/run/${sample_sheet}" \
--no-lane-splitting \
--runfolder-dir /mnt/run \
--output-dir /mnt/output &>"${out_dir}/bcl2fastq_{log_name}.log"

exit
