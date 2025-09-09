###  Statistical value result analisis  ###


#0.eggnog results of pattern combined

pattern_files=("input_files/multifasta_n_split_1_MM_mbjisyoj.emapper.annotations.tsv" "input_files/multifasta_n_split_2_MM_elazjdnq.emapper.annotations.tsv" "input_files/multifasta_n_split_3_MM_8x6axw47.emapper.annotations.tsv" "input_files/multifasta_n_split_4_MM_7u2vtudo.emapper.annotations.tsv" "input_files/multifasta_n_split_5_MM_jvfz4z3a.emapper.annotations.tsv" "input_files/multifasta_p_MM_lfgn2f1h.emapper.annotations.tsv")

grep "#query" input_files/multifasta_n_split_1_MM_mbjisyoj.emapper.annotations.tsv > pattern_eggnog_results_combined.tsv

for file in "${pattern_files[@]}"; do
    grep -v "#" $file >> pattern_eggnog_results_combined.tsv
done

#1.pattern filtering

grep "#query" pattern_eggnog_results_combined.tsv > pattern_e_5.tsv
grep "#query" pattern_eggnog_results_combined.tsv > pattern_e_10.tsv

grep -v "#" pattern_eggnog_results_combined.tsv | awk '$3+0 < 0.00001' >> pattern_e_5.tsv
grep -v "#" pattern_eggnog_results_combined.tsv | awk '$3+0 < 0.0000000001' >> pattern_e_10.tsv

#only ko column + cleaning

grep -v "#" pattern_e_5.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sed 's/ko://g' | sort | uniq > pattern_e_5_list_uniq
grep -v "#" pattern_e_10.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sed 's/ko://g' | sort | uniq > pattern_e_10_list_uniq

grep -v "#" pattern_e_5.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sort | uniq > pattern_e_5_list_uniq_with_ko
grep -v "#" pattern_e_10.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sort | uniq > pattern_e_10_list_uniq_with_ko

nrko_pattern_e_5=$(cat pattern_e_5_list_uniq | wc -l)
nrko_pattern_e_10=$(cat pattern_e_10_list_uniq | wc -l)

echo -e "Number of ko numbers in pattern with e-value less than 1e-5: $nrko_pattern_e_5"
echo -e "Number of ko numbers in pattern with e-value less than 1e-10: $nrko_pattern_e_10"

#2.metagenome filtering

grep "#query" input_files/eggnog_output.emapper.annotations > sample_e_3.tsv
grep "#query" input_files/eggnog_output.emapper.annotations > sample_e_5.tsv
grep "#query" input_files/eggnog_output.emapper.annotations > sample_e_10.tsv

grep -v "#" input_files/eggnog_output.emapper.annotations | awk '$3+0 < 0.001' >> sample_e_3.tsv
grep -v "#" input_files/eggnog_output.emapper.annotations | awk '$3+0 < 0.00001' >> sample_e_5.tsv
grep -v "#" input_files/eggnog_output.emapper.annotations | awk '$3+0 < 0.0000000001' >> sample_e_10.tsv

#only ko column + cleaning

grep -v "#" sample_e_3.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sed 's/ko://g' | sort | uniq > sample_e_3_list_uniq
grep -v "#" sample_e_5.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sed 's/ko://g' | sort | uniq > sample_e_5_list_uniq
grep -v "#" sample_e_10.tsv | cut -f12 | grep "ko" | tr ',' '\n' | sed 's/ko://g' | sort | uniq > sample_e_10_list_uniq

nrko_sample_e_3=$(cat sample_e_3_list_uniq | wc -l)
nrko_sample_e_5=$(cat sample_e_5_list_uniq | wc -l)
nrko_sample_e_10=$(cat sample_e_10_list_uniq | wc -l)

echo -e "Number of ko numbers in sample with e-value less than 1e-3: $nrko_sample_e_3"
echo -e "Number of ko numbers in sample with e-value less than 1e-5: $nrko_sample_e_5"
echo -e "Number of ko numbers in sample with e-value less than 1e-10: $nrko_sample_e_10"
