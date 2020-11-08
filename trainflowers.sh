#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=32g
#SBATCH -c 6
#SBATCH --gres=gpu:titan:1
#SBATCH -o flowerjobtitan.log


source activate /software/conda/envs/tensorflow

nvidia-smi

python3 train.py --outdir=./training-runs --gpus=1 --data=./datasets/flowers --mirror=1 --metrics none --cfg=auto -n

nvidia-smi

python3 train.py --outdir=./training-runs --gpus=1 --data=./datasets/flowers --mirror=1 --metrics none --cfg=auto

nvidia-smi

source deactivate
