include:
  - java

untar gatk:
  cmd.run:
    - name: tar jxvf GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}.tar.bz2
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}.tar.bz2
    - require: 
      - cmd: update jdk
    - unless: ls /opt/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}/GenomeAnalysisTK.jar

clean gatk:
  cmd.wait:
    - name: rm -rf /opt/gatk/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}
    - watch:
      - cmd: untar gatk

install gatk:
  cmd.wait:
    - name: mv /usr/local/src/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }} /opt/
    - watch:
      - cmd: clean gatk

/opt/gatk:
  file.symlink:
  - target: /opt/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}

/opt/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}:
  file.directory:
    - mode: 755
    - user: root
    - group: root
    - recurse:
      - mode
      - user
      - group

/usr/local/src/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}.tar.bz2:
  file.managed:
     - source: salt://ngs/src/GenomeAnalysisTK-{{ pillar['ngs_versions']['gatk'] }}.tar.bz2
