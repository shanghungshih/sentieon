# sentieon

## Installation
``` shell
git clone https://github.com/shanghungshih/sentieon.git
```

## Before you start
1. check `sentieon/Jobs/variant_calling.sh`, and revise to your directory (the followings are default setting)
* `main_dir="/home/shanghung/sentieon"`
* `fastq_1="${fastq_folder}/${SampleName}_R1.fastq.gz"`
* `fastq_2="${fastq_folder}/${SampleName}_R2.fastq.gz"`
* update annotation files


## Quick start
1. 
* `-i` - ID-File: the File contain Sample ID
* `-s` - Start: From which lines (sample).
* `-e` - End: To which lines (sample).
``` shell
perl run_Jobs.pl -i test_list.txt -s 1 -e 1
```
