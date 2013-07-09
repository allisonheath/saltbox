include:
  - dev

untar samtools:
  cmd.run:
    - name: tar jxvf samtools-0.1.19.tar.bz2
    - cwd: /usr/local/src
    - unless: ls /usr/local/bin/samtools
    - watch:
      - file: /usr/local/src/samtools-0.1.19.tar.bz2

build samtools:
  cmd.wait:
    - name: make
    - cwd: /usr/local/src/samtools-0.1.19
    - watch:
      - cmd: untar samtools
install samtools:
  cmd.wait:
    - name: mv /usr/local/src/samtools-0.1.19/samtools /usr/local/bin
    - cwd: /usr/local/src/samtools-0.1.19
    - watch:
      - cmd: build samtools

cleanup samtools:
  cmd.wait:
    - name: rm -rf /usr/local/src/samtools-0.1.19
    - watch:
      - cmd: install samtools

/usr/local/src/samtools-0.1.19.tar.bz2:
  file.managed:
     - source: salt://ngs/src/samtools-0.1.19.tar.bz2
#    - source: http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2
#    - source_hash: sha1=ff3f4cf40612d4c2ad26e6fcbfa5f8af84cbe881

