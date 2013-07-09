include:
  - base

unzip picard:
  cmd.run:
    - name: unzip -o picard-tools-{{ pillar['ngs_versions']['picard'] }}.zip
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/picard-tools-{{ pillar['ngs_versions']['picard'] }}.zip
    - require: 
      - pkg: unzip
    - unless: ls /opt/picard-tools-{{ pillar['ngs_versions']['picard'] }}

clean picard:
  cmd.wait:
    - name: rm -rf /opt/picard-tools-{{ pillar['ngs_versions']['picard'] }}
    - watch:
      - cmd: unzip picard

install picard:
  cmd.wait:
    - name: mv /usr/local/src/picard-tools-{{ pillar['ngs_versions']['picard'] }} /opt/; mv /usr/local/src/snappy-java-1.0.3-rc3.jar /opt/picard-tools-{{ pillar['ngs_versions']['picard'] }}
    - watch:
      - cmd: clean picard

/opt/picard:
  file.symlink:
    - target: /opt/picard-tools-{{ pillar['ngs_versions']['picard'] }}

/opt/picard-tools-{{ pillar['ngs_versions']['picard'] }}:
  file.directory:
    - mode: 755
    - user: root
    - group: root
    - recurse:
      - mode
      - user
      - group

/usr/local/src/picard-tools-{{ pillar['ngs_versions']['picard'] }}.zip:
  file.managed:
     - source: salt://ngs/src/picard-tools-{{ pillar['ngs_versions']['picard'] }}.zip

