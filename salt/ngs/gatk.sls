include:
  - java

untar gatk:
  cmd.run:
    - name: tar jxvf GenomeAnalysisTK-2.6-4.tar.bz2
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/GenomeAnalysisTK-2.6-4.tar.bz2
    - require: 
      - cmd: update jdk
    - unless: ls /opt/gatk/GenomeAnalysisTK-2.6-4-g3e5ff60/GenomeAnalysisTK.jar

clean gatk:
  cmd.wait:
    - name: mkdir -p /opt/gatk; rm -rf /opt/gatk/GenomeAnalysisTK-2.6-4-g3e5ff60
    - watch:
      - cmd: untar gatk

install gatk:
  cmd.wait:
    - name: mv /usr/local/src/GenomeAnalysisTK-2.6-4-g3e5ff60 /opt/gatk
    - watch:
      - cmd: clean gatk

/opt/gatk/GenomeAnalysisTK.jar:
  file.symlink:
  - target: /opt/gatk/GenomeAnalysisTK-2.6-4-g3e5ff60/GenomeAnalysisTK.jar


/usr/local/src/GenomeAnalysisTK-2.6-4.tar.bz2:
  file.managed:
     - source: salt://ngs/src/GenomeAnalysisTK-2.6-4.tar.bz2
#    - source: http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.5a.tar.bz2
#    - source_hash: sha1=3ba4a2df24dc2a2578fb399dc77b3c240a5a18be