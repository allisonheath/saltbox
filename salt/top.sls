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
