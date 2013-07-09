include:
  - base

unzip picard:
  cmd.run:
    - name: unzip -o picard-tools-1.94.zip
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/picard-tools-1.94.zip
    - require: 
      - pkg: unzip
    - unless: ls /opt/picard/picard-tools-1.94

clean picard:
  cmd.wait:
    - name: mkdir -p /opt/picard; rm -rf /opt/picard/picard-tools-1.94
    - watch:
      - cmd: unzip picard

install picard:
  cmd.wait:
    - name: mv /usr/local/src/picard-tools-1.94 /opt/picard; mv /usr/local/src/snappy-java-1.0.3-rc3.jar /opt/picard
    - watch:
      - cmd: clean picard

/usr/local/src/picard-tools-1.94.zip:
  file.managed:
     - source: salt://ngs/src/picard-tools-1.94.zip
#    - source: http://sourceforge.net/projects/picard/files/picard-tools/1.94/picard-tools-1.94.zip
#    - source_hash: sha1=2b3dd02374ed74430d8a48e93c8950054044f8a7

