#!/usr/bin/env bash
python src_joint/main.py test \
--dataset ptb \
--consttest-ptb-path data/VnData/VnData/new_test.clean \
--deptest-ptb-path data/VnData/VnData/VnDTv1.1-predicted-test.conll \
--embedding-path data/Word_embeddings/Empty.txt.gz \
--model-path-base models/run27th/joint_single_best_dev=79.34_devuas=85.63_devlas=79.98.pt
