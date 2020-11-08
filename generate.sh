#!/bin/bash
#SBATCH -p gpu
#SBATCH --mem=32g
#SBATCH -c 6
#SBATCH --gres=gpu:titan:1
#SBATCH -o job.log

#Dog Images
#Cat Images
#Paint Images
#Wild Images
#CIFAR Images
#People (FFHQ) Images

source activate /software/conda/envs/tensorflow

cat commands | parallel -j6

source deactivate