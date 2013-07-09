untar jdk:
  cmd.run:
    - name: tar zxvf jdk-7u25-linux-x64.tar.gz
    - cwd: /usr/local/src
    - watch:
      - file: /usr/local/src/jdk-7u25-linux-x64.tar.gz
    - unless: java -version

move jdk:
  cmd.wait:
    - name: mkdir -p /usr/lib/jvm; mv /usr/local/src/jdk1.7.0_25 /usr/lib/jvm/
    - watch:
      - cmd: untar jdk

update jdk:
  cmd.wait:
    - name: update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0_25/bin/javac" 1; update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0_25/bin/java" 1
    - watch:
      - cmd: move jdk

/usr/local/src/jdk-7u25-linux-x64.tar.gz:
  file.managed:
    - source: salt://java/src/jdk-7u25-linux-x64.tar.gz

