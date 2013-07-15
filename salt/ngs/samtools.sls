untar samtools:
  cmd.run:
    - name: tar jxvf samtools-{{ pillar['ngs_versions']['samtools'] }}.tar.bz2
    - cwd: /usr/local/src
    - unless: ls /usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}/samtools
    - watch:
      - file: /usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}.tar.bz2

build samtools:
  cmd.wait:
    - name: make
    - cwd: /usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}
    - require:
      - pkg: build-essential
    - watch:
      - cmd: untar samtools

/usr/local/bin/samtools:
  file.symlink:
    - target: /usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}/samtools

/usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}.tar.bz2:
  file.managed:
     - source: salt://ngs/src/samtools-{{ pillar['ngs_versions']['samtools'] }}.tar.bz2

/usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/usr/local/src/samtools-{{ pillar['ngs_versions']['samtools'] }}/samtools:
  file.managed:
    - user: root
    - group: root
    - mode: 755
