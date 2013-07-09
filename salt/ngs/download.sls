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