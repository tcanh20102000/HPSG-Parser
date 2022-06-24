#!/usr/bin/env bash
python src_joint/main.py train \
 --model-path-base models/run31th/joint_single \
 --epochs 100 \
 --use-chars-lstm \
 --use-words \
 --use-tags \
 --use-cat \
 --const-lada 0.5 \
 --num-layers 12 \
 --dataset ptb \
 --embedding-path data/word_embeddings/empty.txt.gz \
 --model-name joint_single \
 --embedding-type random \
 --checks-per-epoch 4 \
 --train-ptb-path data/VnData/train.clean \
 --dev-ptb-path data/VnData/dev.clean \
 --dep-train-ptb-path data/VnData/VnDTv1.1-predicted-train.conll \
 --dep-dev-ptb-path data/VnData/VnDTv1.1-predicted-dev.conll