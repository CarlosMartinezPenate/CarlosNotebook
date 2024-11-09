---
layout: post
title: Quality Control for Tar Experiment S16
date: '2024-11-04'
categories: Bioinformatic Pipelines
tags: DADA2
---

# Quality Control for Tar experiment S16 amplicon reads
#### Plot Summary for read counts:

This is a graph showing how the values for the parameter MaxEE and TruncQ influence the read distribution of the Survival Table, discussed further in the body of the report:

![/Users/carlosmartinez/Documents/Jens_raw_data/QC_readcount_plot.png](/Users/carlosmartinez/Documents/Jens_raw_data/QC_readcount_plot.png)

#### Tabulated Summary:

This graph shows the retention of reads at the filtering, merging, a chimeral removal step of the DADA2 Pipeline, for the different values of the parameters MaxEE and TruncQ: 

![](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Retained_Reads_Sum_Plot.png)
After the chimera removal, the final retention is **24%** for the more stringent trimming and filtering and 55% for the more relaxed. 

#### Plot summary for read length:

The plot shows the different read lengths obtained depending on the MaxEE and TrunQ parameters used:

![](/Users/carlosmartinez/Documents/Jens_raw_data/Read _len_dist_plot_sun.png)

All trimming and filtering treatments resulted in a **377 nucleotide peak** length 

* MaxEE = c(1,1) + TruncQ = 13, with an average read length of **340** nucleotides and a total of **2.6 Million reads**
* MaxEE = c(1,1) + TruncQ = 2, with an average read length of **329** nucleotides and a total of **5.0 Million reads**
* MaxEE = c(5,5) + TruncQ = 2, with an average read length of **329** nucleotides and a total of **6.0 Million reads**

# DADA2 Pipeline: 
The DADA2 Pipeline (1.32.0) was applied to 608 fastq files, corresponding to 304 samples (Reverse and Forward reads).

files can be found in: [/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data]()

Previous to Trimming and filtration the quality profile plots of the forward and reverse where generated and inspected, reports can be found on:

[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/Report/RawProfileForward.pdf]()
[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/Report/RawProfileReverse.pdf]()

Additionally, the R package ShortRead (1.62.0) was used to inspect the lengths of the reads (301 nucleotides on each read) and the primers used were V4-V5 515/926.

## FilterAndTrim Function in DADA2

**Initial Read Lengths:**

* Forward and reverse reads are initially **301** nucleotides each.

### TrimLeft parameter

**Primer Trimming:**

* `trimLeft=c(20,18)` means:
    * Forward Read: 20 bases are trimmed from the start.
    * Reverse Read:18 bases are trimmed from the start.

* After trimming:
    * Forward read length = 301 - 20 = 281 bases
    * Reverse read length = 301 - 18 = 283 bases

### TruncLen Parameter
**Truncation:**

* `truncLen=c(250,200)` indicates truncating the reads further:
    * Forward Read: Truncated to 250 bases
    * Reverse Read: Truncated to 200 bases

* After truncation:

   * Final forward read length = 250 bases
   * Final reverse read length = 200 bases

**Amplicon Length:**

* The amplicon length is 411 bases, which is the expected length of the DNA fragment between the forward and reverse primers.

### Overlap Calculation:
* Overlap = (forward read length + reverse read length) - amplicon length
* Overlap = (250 + 200) - 411 = **50 bases**

This should be enough overlap for DADA to infer (DADA2 recommends at least 12bps. Better to have at least 20)

### MaxEE Parameter Selection

`out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(250,200),
                     maxN=0, maxEE=c(1,1), truncQ=2, rm.phix=TRUE, trimLeft=c(20,18),
                     compress=TRUE, multithread=TRUE)`

MaxEE parameter: reads with higher than maxEE "expected errors" will be discarded, default is Inf (no filtering), several combinations were tried, to evaluate the effect of this parameter in the final survival table, **TruncQ = 2 in all cases**: 

* MaxEE = c(0,0)
No reads passed the filter.
* MaxEE = c(0,1)
No reads passed the filter.
* MaxEE = c(1,1)
Some input samples had no reads pass the filter: **45, 104, 241, 263, and 278.** 
* MaxEE = c(1,2)
Some input samples had no reads pass the filter: **45, 104, 241, 263, and 278.**
* MaxEE = c(2,2)
Some input samples had no reads pass the filter: **45, 104, 241, 263, and 278.**
* maxEE=c(5,5)
Some input samples had no reads pass the filter: **45, 104, 241.**
* maxEE=c(10,10)
Some input samples had no reads pass the filter: **241.**

#### Samples with cero reads after trimming:

In all cases, at least 1 of the samples doesn't pass the filter, we will explore these samples further from the extraction file found at: [/Users/carlosmartinez/Documents/Jens_raw_data/sample_randomiz_2022_extraction_with_Diklas_lab_controls.xlsx](/Users/carlosmartinez/Documents/Jens_raw_data/sample_randomiz_2022_extraction_with_Diklas_lab_controls.xlsx):

| ID  | Station Treatment         |  Qubit_HS [ng/uL] | Notes extraction                   |
| --- | ------------------------- |  ---------------- | ---------------------------------- |
| 278 | Dor-in                    |  8.33             | NA                                 |
| 263 | MOCK.8                    |  74               | NA                                 |
| 241 | exudate                   |  21.7             | NA                                 |
| 104 | Themo-2                   |  0.0573           | NA                                 |
| 45  | Themo-2                   |  9.4              | after speed vac white weird bubble |

The samples seem to have a broad range of DNA concentrations as read by Qbit. 

#### Quality profile plots for the rejected reads: 


Taking a look at the Quality Profile of these 6 samples to try and understand the reason they were left with cero reads:  

![Rejected forward reads](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_v4_v5_fwd.png)

![](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_v4_v5_rev.png)

The quality of the reads is not great, making sense that they were rejected in the trimming process. Also, the number of reads is pretty low. Sample 241 corresponds to an exudate treatment and has a fairly small number of reads. It might be worth it to relax the trimming in the future, although the reverse reads for this sample would need a stricter truncation. 

These files were ***manually removed from the pipeline*** by moving them into a separate folder, which can be found here:
[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_reads](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_reads)



# Pipeline for High Quality: MaxEE = c(1,1):

Removed reads: 45, 104, 241, 263, and 278. 

## Quality Profile plots:

After removing the files and rerunning the pipeline with MaxEE = (1,1), the quality profile plots were explored once again, the report can be found in:

[/Users/carlosmartinez/Documents/Jens_raw_data/Fil_quality_profile_plots_fwd_1_1.pdf](/Users/carlosmartinez/Documents/Jens_raw_data/Fil_quality_profile_plots_fwd_1_1.pdf)
[/Users/carlosmartinez/Documents/Jens_raw_data/Fil_quality_profile_rev_1_1.pdf](/Users/carlosmartinez/Documents/Jens_raw_data/Fil_quality_profile_rev_1_1.pdf)


## Error rate inspection:

The error rate inspections seem to be fairly expected, however, not much information is available on interpreting such inspections.


Forward reads:
![Forward](/Users/carlosmartinez/Documents/Jens_raw_data/Errors_fwd_1_1.png)

Reverse reads:
![Reverse](/Users/carlosmartinez/Documents/Jens_raw_data/Errors_rev_1_1.png)

## Continuing the pipeline

Files were dereplicated, samples inferred, and the pair reads merged, sequence table built, and chimeras removed. 

## Survival table analysis: 
 
The survival table can be found here:
[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_1_1.csv)

#### Survival summary:

* Low reads <= 1000
* High reads >= 10000

| Category     | Count |
| ------------ | ----- |
| Zero_Reads   | 7     |
| Low_Reads    | 23    |
| Medium_Reads | 38    |
| High_Reads   | 231   |
| Total_Reads  | 299   |

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/read_counts_summary_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/read_counts_summary_1_1.csv)


| Step             | Total_Reads | Percentage_Retained |
| ---------------- | ----------- | ------------------- |
| Input            | 10873485    | 100                 |
| Filtered         | 7674418     | 70.58               |
| Denoised Forward | 7462914     | 68.63               |
| Denoised Reverse | 7512073     | 69.09               |
| Merged           | 5204395     | 47.86               |
| Non-Chimeric     | 5019768     | 46.17               |

[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Summary_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Summary_1_1.csv)

#### Survival plot: 

![](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Plot_1_1.png)

## Metadata Mergin:

To identify and explore the different read counts, metadata related to the readings was merged with the survival tables. The metadata file can be found at [/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/metadata_jenclean.csv](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/metadata_jenclean.csv). 

### Zero Count Samples:

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_1_1.csv):

| Sample_ID               | Station_treatment | Filter_Type |
| ----------------------- | ----------------- | ----------- |
| 1337_095_S95_L001       | Themo-2           | 11_um       |
| 1337_218_S218_L001      | control           | 11_um       |
| 1337_236_S236_L001      | exudate           | sterivex    |
| 1337_246_S246_L001      | DDW               | sterivex    |
| 1337_248_S248_L001      | MOCK.2            | NA          |
| 1337_279_S279_L001      | Dor-in            | sterivex    |
| 1337_pcr2_nc2_S304_L001 | NA                | NA          |

### Low Count Samples (<1000 reads) (HEAD):

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/low_read_samples_merged_meta_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/low_read_samples_merged_meta_1_1.csv)

| Sample_ID               | nonchim | Station_treatment | Filter_Type |
| ----------------------- | ------- | ----------------- | ----------- |
| 1337_188_S188_L001      | 1       | pollution_cruise  | sterivex    |
| 1337_107_S107_L001      | 2       | Themo-2           | 11_um       |
| 1337_262_S262_L001      | 4       | MOCK.lab.3        | sterivex    |
| 1337_285_S285_L001      | 6       | DOR1              | sterivex    |
| 1337_pcr2_nc1_S303_L001 | 14      | NA                | NA          |
| 1337_257_S257_L001      | 17      | MOCK.lab.2        | sterivex    |

### Mid count samples (<10000, >1000) (HEAD)

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/medium_read_samples_merged_meta_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/medium_read_samples_merged_meta_1_1.csv)

| Sample_ID          | nonchim | Station_treatment | Filter_Type |
| ------------------ | ------- | ----------------- | ----------- |
| 1337_128_S128_L001 | 3730    | Themo-2           | 11_um       |
| 1337_127_S127_L001 | 4321    | Themo-2           | 11_um       |
| 1337_108_S108_L001 | 4897    | Themo-2           | 11_um       |
| 1337_163_S163_L001 | 5226    | Themo-2           | 11_um       |
| 1337_117_S117_L001 | 5478    | Themo-2           | 11_um       |
| 1337_176_S176_L001 | 5649    | Themo-2           | 11_um       |

### High count samples (>10000 reads)(HEAD):
[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_1_1.csv)

| Sample_ID               | nonchim | Station_treatment | Filter_Type |
| ----------------------- | ------- | ----------------- | ----------- |
| 1337_133_S133_L001      | 10041   | Themo-2           | 11_um       |
| 1337_209_S209_L001      | 10277   | SW                | 11_um       |
| 1337_010_S10_L001       | 10378   | Themo-2           | sterivex    |
| 1337_129_S129_L001      | 10386   | Themo-2           | 11_um       |
| 1337_116_S116_L001      | 10389   | Themo-2           | 11_um       |
| 1337_191_S191_L001      | 10572   | pollution_cruise  | 11_um       |

# Pipeline for Low Quality: MaxEE = c(5,5):

Removed reads 45, 104, 241.

## Survival table analysis: 
 
The survival table can be found here:
[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_5_5.csv](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_5_5.csv)

#### Survival summary:

* Low reads <= 1000
* High reads >= 10000

| Category     | Count |
| ------------ | ----- |
| Zero_Reads   | 9     |
| Low_Reads    | 23    |
| Medium_Reads | 26    |
| High_Reads   | 243   |
| Total_Reads  | 301   |

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/read_counts_summary_5_5.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/read_counts_summary_5_5.csv)


| Step             | Total_Reads | Percentage_Retained |
| ---------------- | ----------- | ------------------- |
| Input            | 10873577    | 100                 |
| Filtered         | 9296536     | 85.50               |
| Denoised Forward | 9045462     | 83.19               |
| Denoised Reverse | 9110316     | 83.78               |
| Merged           | 6224052     | 57.24               |
| Non-Chimeric     | 6001218     | 55.19               |

[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Summary_1_1.csv](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Summary_1_1.csv)

#### Survival plot: 

![](/Users/carlosmartinez/Documents/Jens_raw_data/read_count_dist_5_5.png)

## Metadata Mergin:

To identify and explore the different read counts, metadata related to the readings was merged with the survival tables. The metadata file can be found at [/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/metadata_jenclean.csv](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/metadata_jenclean.csv). 

### Zero Count Samples:

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_5_5.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_5_5.csv)

### Low Count Samples (reads < 1000):

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/low_read_samples_merged_meta_5_5.csv](Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/low_read_samples_merged_meta_5_5.csv)

### Mid count samples (1000 > reads < 10000)

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/medium_read_samples_merged_meta_5_5.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/medium_read_samples_merged_meta_5_5.csv)


### High count samples (reads > 1000):
[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_5_5.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_5_5.csv)

# Other Quality Explorations
## Q = truncQ(2) + (MaxEE = (1,1)

Will discard all the sequences in which there was at least one read with the probability of erroneous base assignment of 63%

![](/Users/carlosmartinez/Documents/Jens_raw_data/Read_length_1_1_Q2.png)

## Q = truncQ(13) + (MaxEE = (1,1)

Will discard all the sequences in which there was at least one read with the probability of erroneous base assignment of 5%, an additional sample (**188, from pollution cruise did not pass the filter**)

### Read Length Distribution:

![](/Users/carlosmartinez/Documents/Jens_raw_data/read_len_dist_1_1_Q13.png)

## Q = truncQ(2) + (MaxEE = (5,5)
Will discard all the sequences in which there was at least one read with the probability of erroneous base assignment of 38%
![](/Users/carlosmartinez/Documents/Jens_raw_data/read_len_dist_5_5_Q2.png)

## Survival table analysis: 
 
The survival table can be found here:
[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_1_1_Q13.csv)

#### Survival summary:

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/read_counts_summary_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/read_counts_summary_1_1_Q13.csv)

* Low reads <= 1000
* High reads >= 10000


| Category     | Count |
| ------------ | ----- |
| Zero_Reads   | 9     |
| Low_Reads    | 20    |
| Medium_Reads | 159   |
| High_Reads   | 110   |
| Total_Reads  | 298   |


[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Summary_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Summary_1_1_Q13.csv)

| Step             | Total_Reads | Percentage_Retained |
| ---------------- | ----------- | ------------------- |
| Input            | 10873333    | 100                 |
| Filtered         | 3828495     | 35.21               |
| Denoised Forward | 3680913     | 33.85               |
| Denoised Reverse | 3719028     | 34.20               |
| Merged           | 2704997     | 24.88               |
| Non-Chimeric     | 2612170     | 24.02               |

#### Survival plot: 

![](/Users/carlosmartinez/Documents/Jens_raw_data/read_count_dist_1_1_Q13.png)

## Metadata Mergin:

To identify and explore the different read counts, metadata related to the readings was merged with the survival tables. The metadata file can be found at [/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/metadata_jenclean.csv](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/metadata_jenclean.csv). 

### Zero Count Samples:

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/zero_read_samples_merged_meta_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/zero_read_samples_merged_meta_1_1_Q13.csv)

### Low Count Samples (reads < 1000):

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/low_read_samples_merged_meta_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/low_read_samples_merged_meta_1_1_Q13.csv)

### Mid count samples (1000 > reads < 10000)

[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/medium_read_samples_merged_meta_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/medium_read_samples_merged_meta_1_1_Q13.csv)


### High count samples (reads > 1000):
[/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_1_1_Q13.csv](/Users/carlosmartinez/Documents/Jens_raw_data/survival_tables/high_read_samples_merged_meta_1_1_Q13.csv)




