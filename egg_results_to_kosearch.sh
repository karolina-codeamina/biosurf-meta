#!/usr/bin/env bash

#eggnog results mapper.annotations file 
INPUT="eggnog_output.emapper.annotations"
OUTPUT_LIST="found_ko_s_p_e10_list"
INTERMEDIATE_OUTPUT="found_ko_s_p_e10_intermediate"
OUTPUT_TABLE="found_ko_s_p_e10_table.tsv"
OUTPUT_UNIQ_LIST="found_ko_s_p_e10_list_uniq"
PATTERN="pattern_e_10_list_uniq"
PATTERN_WITH_KO="pattern_e_10_list_uniq_with_ko"

grep -v "#" $INPUT | cut -f12 | grep "ko" | tr ',' '\n' | sed 's/ko://g' > $INTERMEDIATE_OUTPUT

echo -e "$INTERMEDIATE_OUTPUT created"

grep -F -f $PATTERN $INTERMEDIATE_OUTPUT > $OUTPUT_LIST

echo -e "$OUTPUT_LIST created"

ko_found=$(wc -l $OUTPUT_LIST)

echo -e "Number of found ko: $ko_found"

#clean annotation table (only with found ko) generation

grep "#query" $INPUT > $OUTPUT_TABLE

grep -v "#" $INPUT | grep -F -f $PATTERN_WITH_KO >> $OUTPUT_TABLE

echo -e "$OUTPUT_TABLE created"

ko_lines=$(grep -v "#" $OUTPUT_TABLE | wc -l)

echo -e "Number of ko lines: $ko_lines"

cat $OUTPUT_LIST | sort | uniq > $OUTPUT_UNIQ_LIST

ko_uniq=$(wc -l $OUTPUT_UNIQ_LIST)

echo -e "Number of uniq ko found: $ko_uniq"

