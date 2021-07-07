FROM openkbs/jdk11-mvn-py3

USER root

ARG INTELLIJ_VERSION="ideaIC-2021.1.3"

ARG INTELLIJ_IDE_TAR=${INTELLIJ_VERSION}.tar.gz

WORKDIR /jb

RUN wget -nv https://download-cf.jetbrains.com/idea/${INTELLIJ_IDE_TAR} && \
    tar xzf ${INTELLIJ_IDE_TAR} && \
    tar tzf ${INTELLIJ_IDE_TAR} | head -1 | sed -e 's/\/.*//' | xargs -I{} ln -s {} idea && \
    rm ${INTELLIJ_IDE_TAR} && \
