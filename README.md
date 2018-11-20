# sentieon
GATK best practice variant calling pipeline implements with license server for Sentieon

    .
    ├── Jobs    
    │   ├── run_Jobs.pl
    │   ├── variant_calling.sh
    │   ├── check_Jobs.sh
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
1. decompress sentieon bin file
``` shell
tar zxvf sentieon-genomics-201808.tar.gz
```

2. download reference and annotation data (recommad using `screen` rather than `bg` or `&`)
    - open new screen : `screen -S download_hg19`, and run `bash hg19_download.sh`, then `ctrl+A+D` to detach
    - attach existed screen : get screen id with `screen -ls`, and `screen -r xxx` to attach, then `ctrl+A+D` to detach
    - close existed screen : get screen id with `screen -ls`, and `screen -r xxx` to attach, then `ctrl+D` to close it
    
3. check `sentieon/Jobs/variant_calling.sh`, the followings are default setting:
    - SENTIEON_LICENSE : `export SENTIEON_LICENSE=xxx.xxx.xxx.xxx:xxx`
    - main directory : `main_dir="/home/shanghung/sentieon"`
    - fastq1 file name : `fastq_1="${fastq_folder}/${SampleName}_R1.fastq.gz"`
    - fastq2 file name : `fastq_2="${fastq_folder}/${SampleName}_R2.fastq.gz"`
    - number of threads : `nt=32`
    - update annotation files

4. check `sentieon/Jobs/run_Jobs.pl` for changing max parallel numbers (depend on the total threads and $nt you set):
    - line36 : `$running_job < 2`

5. put raw data of the sample to `sentieon/Fastq` in corresponding folder 


## Quick start
1. run jobs (suggest running via screen)
    - `-i` : ID-File: the File contain Sample ID
    - `-s` : Start: From which lines (sample).
    - `-e` : End: To which lines (sample).
``` shell
perl run_Jobs.pl -i test_list.txt -s 1 -e 1
```

2. check jobs (if checkpoint found in Outputs, then return success)
    - list_ID : read from command line
    - checkpoint : "*.vqsr_SNP_INDEL.VQSR.pdf" (default)
``` shell
bash check_Jobs.sh test_list.txt
```
