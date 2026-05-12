# Experiment code

This folder contains the cleaned Python implementation used to run LogicLM and PBS experiments from the beam databases.

## Solver rule

- FOLIO uses Prover9.
- PrOntoQA uses SWI-Prolog.
- ProofWriter uses SWI-Prolog.

The same solver is used for both LogicLM and PBS for a given dataset.

## Methods

- `logiclm`: uses only the first beam candidate `F1`. Optional self-refinement can be enabled with `--refiner-model`.
- `pbs`: uses `F1` to `F5`, transforms `log_scores` into possibility degrees with the T1/Klir transformation, solves each candidate, then aggregates the results.

## Install on Kaggle

```bash
apt-get update -qq
apt-get install -y swi-prolog -q
pip install -r requirements.txt
```

For FOLIO, Prover9 is loaded through `pyprover9`. If needed, you can set:

```bash
export PROVER9_BIN=/path/to/prover9
```

## Run one experiment

```bash
python src/run_experiment.py --model qwen --dataset prontoqa --method pbs
python src/run_experiment.py --model qwen --dataset prontoqa --method logiclm
python src/run_experiment.py --model llama3 --dataset folio --method pbs
```

## Run LogicLM with self-refinement

```bash
python src/run_experiment.py \
  --model llama3 \
  --dataset prontoqa \
  --method logiclm \
  --refiner-model unsloth/Meta-Llama-3.1-8B-Instruct \
  --max-refinements 3
```

## Quick test on 20 examples

```bash
python src/run_experiment.py --model qwen --dataset prontoqa --method pbs --limit 20
```

## Expected repository layout

```text
POSS-LOGIC-LM/
├── databases/
│   ├── qwen/
│   ├── llama3/
│   └── phi3_5_mini/
├── results/
├── src/
└── scripts/
```
