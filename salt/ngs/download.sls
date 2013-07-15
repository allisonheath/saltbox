{{ pillar['file_roots']['base'] }}/ngs/src/bwa-{{ pillar['ngs_versions']['bwa'] }}.tar.bz2:
  file.managed:
    - source: http://sourceforge.net/projects/bio-bwa/files/bwa-{{ pillar['ngs_versions']['bwa'] }}.tar.bz2
    - source_hash: sha1={{ pillar['ngs_sha1']['bwa'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/picard-tools-{{ pillar['ngs_versions']['picard'] }}.zip:
  file.managed:
    - source: http://sourceforge.net/projects/picard/files/picard-tools/{{ pillar['ngs_versions']['picard'] }}/picard-tools-{{ pillar['ngs_versions']['picard'] }}.zip
    - source_hash: sha1={{ pillar['ngs_sha1']['picard'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/samtools-{{ pillar['ngs_versions']['samtools'] }}.tar.bz2:
  file.managed:
    - source: http://sourceforge.net/projects/samtools/files/samtools/{{ pillar['ngs_versions']['samtools'] }}/samtools-{{ pillar['ngs_versions']['samtools'] }}.tar.bz2
    - source_hash: sha1={{ pillar['ngs_sha1']['samtools'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/bowtie2-{{ pillar['ngs_versions']['bowtie2'] }}-linux-x86_64.zip:
  file.managed:
    - source: http://sourceforge.net/projects/bowtie-bio/files/bowtie2/{{ pillar['ngs_versions']['bowtie2'] }}/bowtie2-{{ pillar['ngs_versions']['bowtie2'] }}-linux-x86_64.zip/download
    - source_hash: sha1={{ pillar['ngs_sha1']['bowtie2'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/tophat-{{ pillar['ngs_versions']['tophat'] }}.Linux_x86_64.tar.gz:
  file.managed:
    - source: http://tophat.cbcb.umd.edu/downloads/tophat-{{ pillar['ngs_versions']['tophat'] }}.Linux_x86_64.tar.gz
    - source_hash: sha1={{ pillar['ngs_sha1']['tophat'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/cufflinks-{{ pillar['ngs_versions']['cufflinks'] }}.Linux_x86_64.tar.gz:
  file.managed:
    - source: http://cufflinks.cbcb.umd.edu/downloads/cufflinks-{{ pillar['ngs_versions']['cufflinks'] }}.Linux_x86_64.tar.gz
    - source_hash: sha1={{ pillar['ngs_sha1']['cufflinks'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/BEDTools.v{{ pillar['ngs_versions']['bedtools'] }}.tar.gz:
  file.managed:
    - source: http://bedtools.googlecode.com/files/BEDTools.v{{ pillar['ngs_versions']['bedtools'] }}.tar.gz
    - source_hash: sha1={{ pillar['ngs_sha1']['bedtools'] }}

{{ pillar['file_roots']['base'] }}/ngs/src/STAR_{{ pillar['ngs_versions']['rna-star'] }}.Linux_x86_64.tgz:
  file.managed:
    - source: http://rna-star.googlecode.com/files/STAR_{{ pillar['ngs_versions']['rna-star'] }}.Linux_x86_64.tgz
    - source_hash: sha1={{ pillar['ngs_sha1']['rna-star'] }}