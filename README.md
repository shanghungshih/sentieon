# sentieon

    .sentieon
    ├── Jobs    
    │   ├── run_Jobs.pl
    │   ├── variant_calling.sh
    │   ├── _rc_function_.sh
    │   ├── test_list.txt
    │   ├── Outputs
    │   └── logs
    ├── Fastq                   
    ├── Reference
    │   └── hg19_download.sh
    ├── bins    
    │   └── sentieon-genomics-201808.tar.gz
    └── README.md

## Installation
``` shell
git clone https://github.com/shanghungshih/sentieon.git
```

## Before you start
1. check `sentieon/Jobs/variant_calling.sh`, the followings are default setting:
  - - main directory : `main_dir="/home/shanghung/sentieon"`
  - - fastq1 file name : `fastq_1="${fastq_folder}/${SampleName}_R1.fastq.gz"`
  - fastq2 file name : `fastq_2="${fastq_folder}/${SampleName}_R2.fastq.gz"`
  - number of threads to use : `nt=32`
  - update annotation files

2. check `sentieon/Jobs/run_Jobs.pl` for changing max parallel numbers:
  - max parallel numbers : `max_num=3`

3. download reference and annotation data (recommad using `screen` rather than `bg` or `&`)
  - open new screen : `screen -S download_hg19`, and run `bash hg19_download.sh`, then `ctrl+A+D` to detach
  - attach existed screen : get screen id with `screen -ls`, and `screen -r xxx` to attach, then `ctrl+A+D` to detach
  - close existed screen : get screen id with `screen -ls`, and `screen -r xxx` to attach, then `ctrl+D` to close it

4. decompress sentieon bin file
``` shell
tar zxvf sentieon-genomics-201808.tar.gz
```

5. put raw data of the sample to `sentieon/fastq` in corresponding folder 

## Quick start
* `-i` : ID-File: the File contain Sample ID
* `-s` : Start: From which lines (sample).
* `-e` : End: To which lines (sample).
``` shell
perl run_Jobs.pl -i test_list.txt -s 1 -e 1
```

