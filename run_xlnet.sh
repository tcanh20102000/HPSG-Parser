#!/usr/bin/env bash
python src_joint/main.py train \
 --model-path-base models/run4th/joint_xlnet \
 --epochs 40 \
 --use-xlnet \
 --const-lada 0.8 \
 --dataset ptb \
 --embedding-path data/glove.6B.100d.txt.gz \
 --model-name joint_xlnet \
 --checks-per-epoch 4 \
 --num-layers 2 \
 --learning-rate 0.00005 \
 --batch-size 100 \
 --eval-batch-size 20 \
 --subbatch-max-tokens 1000 \
 --train-ptb-path data/VnData/VnData4/train.clean \
 --dev-ptb-path data/VnData/VnData4/dev.clean \
 --dep-train-ptb-path data/VnData/VnData4/dep_train.clean \
 --dep-dev-ptb-path data/VnData/VnData4/dep_dev.clean