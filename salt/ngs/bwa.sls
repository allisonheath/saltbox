include:
  - base

untar bwa:
  cmd.run:
    - name: tar jxvf bwa-0.7.5a.tar.bz2
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/bwa-0.7.5a.tar.bz2
    - unless: ls /usr/local/bin/bwa

build bwa:
  cmd.wait:
    - name: make
    - cwd: /usr/local/src/bwa-0.7.5a
    - watch:
      - cmd: untar bwa
    - require:
      - pkg: build-essential
      - pkg: libncurses
      - pkg: zlib1g-dev

install bwa:
  cmd.wait:
    - name: mv /usr/local/src/bwa-0.7.5a/bwa /usr/local/bin
    - cwd: /usr/local/src/bwa-0.7.5a
    - watch:
      - cmd: build bwa

cleanup bwa:
  cmd.wait:
    - name: rm -rf /usr/local/src/bwa-0.7.5a
    - watch:
      - cmd: install bwa

libncurses:
  pkg:
    - name: libncurses5-dev
    - installed

zlib:
  pkg:
    - name: zlib1g-dev
    - installed

/usr/local/src/bwa-0.7.5a.tar.bz2:
  file.managed:
     - source: salt://ngs/src/bwa-0.7.5a.tar.bz2
#    - source: http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.5a.tar.bz2
#    - source_hash: sha1=3ba4a2df24dc2a2578fb399dc77b3c240a5a18be