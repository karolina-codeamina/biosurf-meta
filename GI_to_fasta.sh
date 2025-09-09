#!/bin/bash

input="df_n_no_seq.csv"
output="df_n_no_seq.fasta"
not_downloaded="not_downloaded_n_fasta.txt"

> "$output"
> "$not_downloaded"

tail -n +2 "$input" | while read -r ID
do
    fasta=$(echo "$ID" | epost -db nucleotide -email <your@email.com> | efetch -format fasta)

    if [[ -z "$fasta" ]]; then
        echo "$ID" >> "$not_downloaded"
    else
        header=$(echo "$fasta" | head -n1)
        seq=$(echo "$fasta" | tail -n +2)

        header_content="${header#>}"

        new_header=">$ID $header_content"

        {
            echo "$new_header"
            echo "$seq"
        } >> "$output"
    fi
done

