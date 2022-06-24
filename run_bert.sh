#!/usr/bin/env bash
python src_joint/main.py train \
 --model-path-base models/run7th/joint_bert \
  --epochs 100 \
 --use-bert \
 --const-lada 0.5 \
 --dataset ptb \
 --embedding-path data/glove.6B.100d.txt.gz\
 --model-name joint_bert \
 --checks-per-epoch 4 \
 --num-layers 2 \
 --learning-rate 0.00005 \
 --batch-size 8 \
 --eval-batch-size 20 \
 --subbatch-max-tokens 500 \
 --train-ptb-path data/VnData/VnData4/train.clean \
 --dev-ptb-path data/VnData/VnData4/dev.clean \
 --dep-train-ptb-path data/VnData/VnData4/dep_train.clean \
 --dep-dev-ptb-path data/VnData/VnData4/dep_dev.clean