#!/usr/bin/env bash
python src_joint/main.py parse \
--dataset ptb \
--save-per-sentences 1000 \
--eval-batch-size 50 \
--input-path input_s.txt \
--output-path-synconst output/synconst \
--output-path-syndep output/syndephead \
--output-path-synlabel output/syndeplabel \
--embedding-path data/word_embeddings/empty.txt.gz \
--model-path-base models_jointsinge/joint_single_best_dev=nan_devuas=73.76_devlas=65.72.pt
