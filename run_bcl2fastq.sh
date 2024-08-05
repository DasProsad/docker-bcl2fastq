#!/bin/bash

# Function to display usage information
usage() {
	echo "Usage: $0 -r <ngs_run_dir> -o <out_dir> -s <sample_sheet> -l <log_name>"
	exit 1
}

# Parse command-line arguments
while getopts "r:o:s:l:" opt; do
	case $opt in
		r) run_dir="$OPTARG" ;;
		o) out_dir="$OPTARG" ;;
		s) sample_sheet="$OPTARG" ;;
		l) log_name="$OPTARG" ;;
		*) usage ;;
	esac
done

# Check if all arguments are provided
if [ -z "$run_dir" ] || [ -z "$out_dir" ] || [ -z "$sample_sheet" ] || [ -z "$log_name" ]; then
	usage
fi

# Run Docker container
sudo docker run \
	-v "$run_dir":/mnt/run \
	-v "$out_dir":/mnt/output \
	zymoresearch/bcl2fastq \
	--barcode-mismatches 1 \
	--sample-sheet "/mnt/run/${sample_sheet}" \
	--no-lane-splitting \
	--runfolder-dir /mnt/run \
	--output-dir /mnt/output &>"${out_dir}/bcl2fastq_${log_name}.log"

exit
