include:
  - base

untar bwa:
  cmd.run:
    - name: tar jxvf bwa-{{ pillar['ngs_versions']['bwa'] }}.tar.bz2
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}.tar.bz2
    - unless: ls /usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}/bwa

build bwa:
  cmd.wait:
    - name: make
    - cwd: /usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}
    - watch:
      - cmd: untar bwa
    - require:
      - pkg: build-essential
      - pkg: libncurses
      - pkg: zlib1g-dev

/usr/local/bin/bwa:
  file.symlink:
    - target: /usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}/bwa

libncurses:
  pkg:
    - name: libncurses5-dev
    - installed

zlib:
  pkg:
    - name: zlib1g-dev
    - installed

/usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}/bwa:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - create: False

/usr/local/src/bwa-{{ pillar['ngs_versions']['bwa'] }}.tar.bz2:
  file.managed:
     - source: salt://ngs/src/bwa-{{ pillar['ngs_versions']['bwa'] }}.tar.bz2
