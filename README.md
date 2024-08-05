![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/zymoresearch/bcl2fastq) ![Docker Pulls](https://img.shields.io/docker/pulls/zymoresearch/bcl2fastq) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/zymoresearch/bcl2fastq/latest)

# Supported tags and respective `Dockerfile` links

* [`2.20`](https://github.com/Zymo-Research/docker-bcl2fastq/blob/master/Dockerfile)

# What is bcl2fastq?

The Illumina bcl2fastq2 Conversion Software demultiplexes sequencing data and converts base call (BCL) files into FASTQ files. For more information, please see the latest [software guide](https://github.com/DasProsad/docker-bcl2fastq/blob/master/bcl2fastq2-v2-20-guide.pdf).

This image is built based on Alpine Linux. It's very lightweight with only 36M in size.

# How to use this image

## Make the run script exceutable
```bash
chmod +x run_bcl2fastq.sh
```
## Demultiplex BCL files
```bash
./run_bcl2fastq.sh -r "/path/to/ngs_run_dir" -o "/path/to/out_dir" -s "sample_sheet.csv" -l "log_name"
```
