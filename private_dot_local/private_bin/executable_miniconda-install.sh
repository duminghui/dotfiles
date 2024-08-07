#!/bin/sh
set -eux
MINICONDA_HOME=~/.local/share/miniconda3
MINICONDA_DOWNLOAD_URL=https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-MacOSX-arm64.sh
MINICONDA_DOWNLOAD_FILE=$MINICONDA_HOME/miniconda.sh

mkdir -p $MINICONDA_HOME
curl $MINICONDA_DOWNLOAD_URL -o $MINICONDA_DOWNLOAD_FILE
bash $MINICONDA_DOWNLOAD_FILE -b -u -p $MINICONDA_HOME
rm -rf $MINICONDA_DOWNLOAD_FILE

