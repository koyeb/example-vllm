#!/bin/bash

declare -a patterns=("*.json" "tokenizer*" "*.safetensors" "*.bin" "*.pt")

for p in "${patterns[@]}"; do
    huggingface-cli download $MODEL_NAME \
        --revision $REVISION \
        --include $p
done
