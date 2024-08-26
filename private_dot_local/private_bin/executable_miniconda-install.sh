#!/bin/sh
set -eux
MINICONDA_HOME=~/.local/share/miniconda3
MINICONDA_DOWNLOAD_URL=https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-MacOSX-arm64.sh
MINICONDA_DOWNLOAD_FILE=$MINICONDA_HOME/miniconda3-latest-arm64.sh

mkdir -p $MINICONDA_HOME

cd $MINICONDA_HOME
rm -rf .nonadmin _conda bin cmake conda-meta condabin etc include lib LICENSE.txt man pkgs python.app sbin share shell ssl

curl $MINICONDA_DOWNLOAD_URL -o $MINICONDA_DOWNLOAD_FILE
bash $MINICONDA_DOWNLOAD_FILE -b -u -p $MINICONDA_HOME
rm -rf $MINICONDA_DOWNLOAD_FILE
