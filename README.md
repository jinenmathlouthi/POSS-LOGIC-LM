# POSS-LOGIC-LM

This repository contains the datasets, experimental results, and source code used for experiments on possibilistic aggregation for logical reasoning with language models.

The goal of this work is to compare a LogicLM-style pipeline with our proposed possibilistic beam-search approach, referred to here as PBS.

## 1. Repository objective

The repository is designed to support the experiments reported in the paper.

It provides:

- beam-search databases generated from language models;
- experimental results for LogicLM and PBS;
- cleaned source code for reproducing the experiments;
- a unified structure for running the same protocol across models and datasets.

The experiments compare two methods:

1. **LogicLM baseline**  
   LogicLM uses the first beam candidate, noted `F1`, and applies a self-refinement module when needed.

2. **PBS / Ours**  
   PBS uses the five beam candidates `F1-F5`, their sequence-level log-scores, a probability-to-possibility transformation, and possibilistic aggregation.

## 2. Repository structure

```text
POSS-LOGIC-LM/
│
├── databases/
│   ├── llama3/
│   │   ├── folio_beam_database.json
│   │   ├── prontoqa_beam_database.json
│   │   └── proofwriter_beam_database.json
│   │
│   ├── phi3_5_mini/
│   │   ├── folio_beam_database.json
│   │   ├── prontoqa_beam_database.json
│   │   └── proofwriter_beam_database.json
│   │
│   └── qwen/
│       ├── folio_beam_database.json
│       ├── prontoqa_beam_database.json
│       └── proofwriter_beam_database.json
│
├── results/
│   ├── llama3/
│   ├── phi3_5_mini/
│   └── qwen/
│
├── src/
│   ├── config.py
│   ├── io_utils.py
│   ├── logiclm_pipeline.py
│   ├── metrics.py
│   ├── pbs_pipeline.py
│   ├── possibility.py
│   ├── run_experiment.py
│   ├── self_refinement.py
│   │
│   └── solvers/
│       ├── prolog_solver.py
│       └── prover9_solver.py
│
├── scripts/
│   └── run_all_experiments.sh
│
├── requirements.txt
├── CODE_README.md
├── README.md
├── .gitignore
└── .gitattributes


