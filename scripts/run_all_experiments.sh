#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${1:-.}"

MODELS=(qwen llama3 gemma)
DATASETS=(folio prontoqa proofwriter)
METHODS=(logiclm pbs)

for MODEL in "${MODELS[@]}"; do
  for DATASET in "${DATASETS[@]}"; do
    for METHOD in "${METHODS[@]}"; do
      echo "============================================================"
      echo "Running $MODEL / $DATASET / $METHOD"
      echo "============================================================"
      python src/run_experiment.py \
        --repo-root "$REPO_ROOT" \
        --model "$MODEL" \
        --dataset "$DATASET" \
        --method "$METHOD"
    done
  done
done

