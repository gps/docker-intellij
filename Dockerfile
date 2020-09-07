FROM openkbs/ubuntu-bionic-jdk-mvn-py3

ARG INTELLIJ_VERSION="ideaIC-2020.2.1"

ARG INTELLIJ_IDE_TAR=${INTELLIJ_VERSION}.tar.gz

WORKDIR /opt

COPY jdk.table.xml /etc/idea/config/options/

RUN wget -nv https://download-cf.jetbrains.com/idea/${INTELLIJ_IDE_TAR} && \
    tar xzf ${INTELLIJ_IDE_TAR} && \
    tar tzf ${INTELLIJ_IDE_TAR} | head -1 | sed -e 's/\/.*//' | xargs -I{} ln -s {} idea && \
    rm ${INTELLIJ_IDE_TAR} && \
    echo idea.config.path=/etc/idea/config >> idea/bin/idea.properties && \
    chmod -R 777 /etc/idea && \
    wget https://plugins.jetbrains.com/files/6954/94741/kotlin-plugin-1.4.0-release-IJ2020.2-1.zip && \
    unzip kotlin-plugin-1.4.0-release-IJ2020.2-1.zip && \
    rm -rf /opt/idea/plugins/Kotlin && \
    mv Kotlin /opt/idea/plugins/ && \
    rm kotlin-plugin-1.4.0-release-IJ2020.2-1.zip
    
