# HPSG Neural Parser

This source code is from [DoodleJZ Python implementation](https://github.com/DoodleJZ/HPSG-Neural-Parser) of the parsers described in "Head-Driven Phrase Structure Grammar Parsing on Penn Treebank" from ACL 2019.

## Contents
1. [Requirements](#Requirements)
2. [Training](#Training)
3. [Citation](#Citation)
4. [Credits](#Credits)

## Requirements

* Python 3.6 or higher.
* Cython 0.25.2 or any compatible version.
* [PyTorch](http://pytorch.org/) 0.4.0. This code has not been tested with PyTorch 1.0, but it should work.
* [EVALB](http://nlp.cs.nyu.edu/evalb/). Before starting, run `make` inside the `EVALB/` directory to compile an `evalb` executable. This will be called from Python for evaluation. 
* [AllenNLP](http://allennlp.org/) 0.7.0 or any compatible version, such as 0.9.0. (only required when using ELMo word representations)
* [pytorch-transformers](https://github.com/huggingface/pytorch-transformers) PyTorch 1.0.0+ or any compatible version (only required when using BERT and XLNet, XLNet only for joint span version.)

#### Pre-trained Models (PyTorch)

See [DoodleJZ Github page](https://github.com/DoodleJZ/HPSG-Neural-Parser) for more detail.

## Training

Download VnData folder from this [Google Drive link](https://drive.google.com/drive/folders/1FehuEEe9mckcD3J8ijhvZuV4ma8KOxxB?usp=sharing), and put them in the data/ folder.

### Training Instructions

Some of the available arguments are:

Argument | Description | Default
--- | --- | ---
`--model-path-base` | Path base to use for saving models | N/A
`--evalb-dir` |  Path to EVALB directory | `EVALB/`
` --train-ptb-path` | Path to training constituent parsing | `data/VnData/train.clean`
`--dev-ptb-path` | Path to development constituent parsing | `data/VnData/dev.clean`
`--dep-train-ptb-path` | Path to training dependency parsing | `data/VnData/VnDTv1.1-predicted-train.conll`
`--dep-dev-ptb-path` | Path to development dependency parsing | `data/VnData/VnDTv1.1-predicted-dev.conll`
`--batch-size` | Number of examples per training update | 250
`--checks-per-epoch` | Number of development evaluations per epoch | 4
`--subbatch-max-tokens` | Maximum number of words to process in parallel while training (a full batch may not fit in GPU memory) | 2000
`--eval-batch-size` | Number of examples to process in parallel when evaluating on the development set | 30
`--numpy-seed` | NumPy random seed | Random
`--use-words` | Use learned word embeddings | Do not use word embeddings
`--use-tags` | Use predicted part-of-speech tags as input | Do not use predicted tags
`--use-chars-lstm` | Use learned CharLSTM word representations | Do not use CharLSTM
`--use-elmo` | Use pre-trained ELMo word representations | Do not use ELMo
`--use-bert` | Use pre-trained BERT word representations | Do not use BERT
`--use-xlnet` | Use pre-trained XLNet word representations | Do not use XLNet
`--pad-left` | When using pre-trained XLNet padding on left | Do not pad on left
`--bert-model` | Pre-trained BERT model to use if `--use-bert` is passed | `bert-large-uncased`
`--no-bert-do-lower-case` | Instructs the BERT tokenizer to retain case information (setting should match the BERT model in use) | Perform lowercasing
`--xlnet-model` | Pre-trained XLNet model to use if `--use-xlnet` is passed | `xlnet-large-cased`
`--no-xlnet-do-lower-case` | Instructs the XLNet tokenizer to retain case information (setting should match the XLNet model in use) | Perform uppercasing
`--const-lada` | Lambda weight | 0.5
`--model-name` | Name of model | test
`--embedding-path` | Path to pre-trained embedding | N/A
`--embedding-type` | Pre-trained embedding type | glove, sskip or random (in random mode, pre-trained embedding is not used)
`--dataset`     | Dataset type | ptb


Additional arguments are available for other hyperparameters; see `make_hparams()` in `src/main.py`. These can be specified on the command line, such as `--num-layers 2` (for numerical parameters), `--use-tags` (for boolean parameters that default to False), or `--no-partitioned` (for boolean parameters that default to True).

For each development evaluation, the best_dev_score is the sum of F-score and LAS on the development set and compared to the previous best. If the current model is better, the previous model will be deleted and the current model will be saved. The new filename will be derived from the provided model path base and the development best_dev_score.

As an example, after setting the paths for data and embeddings,
to train a Joint-Span parser, simply run:
```
sh run_single.sh
```
to train a Joint-Span parser with BERT, simply run:
```
sh run_bert.sh
```
to train a Joint-Span parser with XLNet, simply run:
```
sh run_xlnet.sh
```
### Evaluation Instructions

A saved model can be evaluated on a test corpus using the command `python src/main.py test ...` with the following arguments:

Argument | Description | Default
--- | --- | ---
`--model-path-base` | Path base of saved model | N/A
`--evalb-dir` |  Path to EVALB directory | `EVALB/`
`--test-ptb-path` | Path to test constituent parsing | `data/VnData/test.clean`
`--dep-test-ptb-path` | Path to test dependency parsing | `data/VnData/VnDTv1.1-predicted-test.conll`
`--embedding-path` | Path to pre-trained embedding | `data/empty.txt.gz`
`--eval-batch-size` | Number of examples to process in parallel when evaluating on the test set | 100
`--dataset`     | Dataset type | ptb
`--output-path-synconst`     | Path to predicted result in constituent parsing | output/synconst
`--output-path-syndep`     | Path to predicted head result in dependency parsing | output/syndephead
`--output-path-synlabel`     | Path to predicted label result in dependency parsing | output/synlabel

As an example, after extracting the pre-trained model, you can evaluate it on the test set using the following command:

```
sh test.sh
```
If you want to parse the sentences, after setting the input file and pre-trained model, run following command:
```
sh parse.sh
```
### Training on Google Colab

A way to train HPSG parser on Google Colab is to upload this repository on Google Drive, then open the file HPSG.ipynb with Google Colab. HPSG.ipynb contains all the commands you need for training and evaluation so you just need to follow the instructions in that file and configure settings in run_single.sh, test.sh, and parse.sh file. 

**Note**: When training Google Colab, watch out for your Google Drive memory. Since the size of each generated HPSG model is around 0.5GB, the size of models generated from training process may surpass your Google Drive memory capacity. 

## Citation
See [DoodleJZ Github page](https://github.com/DoodleJZ/HPSG-Neural-Parser) for more detail.

## Credits

The code in this repository and the majority of the information in this README are based on https://github.com/DoodleJZ/HPSG-Neural-Parser
