#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=60g
#SBATCH -c 8
#SBATCH --gres=gpu:gtx1080ti:2
#SBATCH -o flowerjob.log


source activate /software/conda/envs/tensorflow

nvidia-smi

python3 train.py --outdir=./training-runs --gpus=2 --data=./datasets/flowers --mirror=1 --metrics none --cfg=auto -n

nvidia-smi

python3 train.py --outdir=./training-runs --gpus=2 --data=./datasets/flowers --mirror=1 --metrics none --cfg=auto

nvidia-smi

source deactivate