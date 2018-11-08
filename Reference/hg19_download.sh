#!/bin/sh

download_dir="ref_hg19"

if [ ! -d ${download_dir} ]; then
mkdir ${download_dir}
fi

# Download from gatk-bundle:
# ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/

# known_1000G_indels
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/1000G_phase1.indels.hg19.sites.vcf.*
# known_Mills_indels
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.*
# vqsr_1000G_omni
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/1000G_omni2.5.hg19.sites.vcf.*
# vqsr_hapmap
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/hapmap_3.3.hg19.sites.vcf.*
# vqsr_1000G_phase1
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/1000G_phase1.snps.high_confidence.hg19.sites.vcf.*
# vqsr_dbsnp
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/dbsnp_138.hg19.vcf.*
# fasta
wget -P "${download_dir}/" ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.*


for fn in "${download_dir}"/*.gz
do
  md5ftp=$(cat $fn.md5 | awk '{print $1}')
  md5loc=$(md5sum $fn | awk '{print $1}')
  if [ $md5ftp == $md5loc ]
  then
    echo "md5 PASS"
  else
    echo "md5 FAIL"
    exit 1
  fi
  gzip -d $fn
  rm $fn.md5
  echo $fn" finished."
done
