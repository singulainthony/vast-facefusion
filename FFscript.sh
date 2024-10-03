#!/bin/bash


echo "Setting Platform"

apt --assume-yes -y install git-all &&
apt --assume-yes -y  install curl &&
apt --assume-yes -y  install ffmpeg &&
apt-get --assume-yes -y install mesa-va-drivers &&

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh &&
bash ~/miniconda.sh -b -p $HOME/miniconda &&
eval "$(/$HOME/miniconda/bin/conda shell.zsh hook)" &&

conda init --all &&
conda create --name facefusion python=3.10  -y &&
conda activate facefusion &&

echo "Runtime Install"

conda install -y conda-forge::cuda-runtime=12.4.1 conda-forge::cudnn=9.2.1.18 &&
pip install tensorrt==10.4.0 -q --extra-index-url https://pypi.nvidia.com &&


echo "Installing FaceFusion"

cd /root/ &&
git clone https://github.com/facefusion/facefusion.git &&

cd /root/facefusion/ &&
python3 install.py --onnxruntime cuda

echo "Install Complete, Now Launch FaceFusion"

