base:
  '*':
    - base
    - edit.emacs

  'roles:master':
    - match: grain
    - ngs.download

  'roles:analysis':
    - match: grain
    - java
    - ngs.bwa
    - ngs.samtools
    - ngs.gatk
    - ngs.picard
    - ngs.bowtie2
    - ngs.tophat
    - ngs.cufflinks
    - ngs.bedtools
    - ngs.rna-star