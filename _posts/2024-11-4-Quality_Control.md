#Quality Control for Tar experiment S16 amplicon reads

The DADA2 Pipeline (1.32.0) was applied to 608 fastq files, corresponding to 304 samples (Reverse and Forward reads).

files can be found in: [/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data]()

Previous to Trimming and filtration the quality profile plots of the forward and reverse where generated and inspected, reports can be found on:

[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/Report/RawProfileForward.pdf]()
[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/Report/RawProfileReverse.pdf]()

Additionally, the R package ShortRead (1.62.0) was used to inspect the lengths of the reads (301 nucleotides on each read) and the primers used were V4-V5 515/926.

## FilterAndTrim Function in DADA2

**Initial Read Lengths:**
* Forward and reverse reads are initially 301 nucleotides each.

### TrimLeft parameter

**Primer Trimming:**
* `trimLeft=c(20,18)` means:
    * **Forward Read:** 20 bases are trimmed from the start.
    * **Reverse Read:** 18 bases are trimmed from the start.

* **After trimming:**
    * Forward read length = 301 - 20 = 281 bases
    * Reverse read length = 301 - 18 = 283 bases

### TruncLen Parameter
**Truncation:**
* `truncLen=c(250,200)` indicates truncating the reads further:
    * **Forward Read:** Truncated to 250 bases
    * **Reverse Read:** Truncated to 200 bases

* **After truncation:**
    * Final forward read length = 250 bases
    * Final reverse read length = 200 bases

**Amplicon Length:**
* The amplicon length is 411 bases, which is the expected length of the DNA fragment between the forward and reverse primers.

## Overlap Calculation:
* Overlap = (forward read length + reverse read length) - amplicon length
* Overlap = (250 + 200) - 411 = 50 bases

This should be enough overlap for DADA to infer (DADA2 recommends at least 12bps. Better to have at least 20)

### MaxEE Parameter Selection

MaxEE parameter: reads with higher than maxEE "expected errors" will be discarded, default is Inf (no filtering), However, as I am interested in the highest quality reads, several combinations will be tried.

* MaxEE = c(0,0)
No reads passed the filter.
* MaxEE = c(0,1)
No reads passed the filter.
* MaxEE = c(1,1)
Some input samples had no reads pass the filter: 45, 104, 241, 263, and 278. 
* MaxEE = c(1,2)
Some input samples had no reads pass the filter: 45, 104, 241, 263, and 278.
* MaxEE = c(2,2)
Some input samples had no reads pass the filter: 45, 104, 241, 263, and 278.
* maxEE=c(5,5)
Some input samples had no reads pass the filter: 45, 104, 241.
* maxEE=c(10,10)
Some input samples had no reads pass the filter: 241.


`out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(220,200),
                     maxN=0, maxEE=c(2,2), truncQ=2, rm.phix=TRUE, trimLeft=c(20,18),
                     compress=TRUE, multithread=TRUE)`
                     
Samples left with zero reads maxEE at maximum 2,2:

* Sample 45: Themo-2
* Sample 104: Themo-2
* Sample 241: exudate
* Sample 263: Mock.8
* Sample 278: Dor-in

| Extraction # | ID  | Replicate | Station | Treatment   | Sampling Date | Cruise | Timepoint | Depth [m] | Volume (L) | LB Volume (mL) | Filter Type | Cast | Extraction Date | Qubit_HS [ng/uL] | Nano Drop (mostly frozen - defrosted - measured) | Defrosted | Measured | Dilution Volume (uL) | Free-thaw | Notes Extraction                     |
|--------------|-----|-----------|---------|-------------|---------------|--------|-----------|-----------|------------|----------------|-------------|------|-----------------|------------------|--------------------------------------------------|-----------|----------|-----------------------|-----------|---------------------------------------|
| 7            | 45  | NA        | Themo-2 | NA          | 8/6/18        | 7      | NA        | 50        | 5.5        | 1.5            | sterivex    | A    | 22.08.2022      | 9.4              | 46.8                                             | 3.04      | 0.06     | 50                    | NA        | after speed vac white weird bubble    |
| 20           | 104 | NA        | Themo-2 | NA          | 3/5/18        | 2      | NA        | 500       | 5          | 1              | 11 um       | B    | 06.11.2022      | 0.0573           | NA                                               | NA        | NA       | NA                    | NA        | NA                                    |
| 25           | 241 | 2         | exudate | NA          | 06.04.2022    | T2     | NA        | NA        | 3.5        | 1              | 11 um       | NA   | 20.11.2022      | 21.7             | NA                                               | NA        | NA       | NA                    | NA        | NA                                    |
                                   |
| 26           | 263 | NA        | MOCK.8 | NA          | NA            | NA     | NA        | NA        | NA         | NA             | NA          | NA   | NA              | 74               | NA                                               | NA        | NA       | NA                    | NA        | NA                                    |
| 27           | 278 | 1         | Dor-in | NA           | 24.02.2021    | NA     | NA        | NA        | NA         | NA             | sterivex    | NA   | 21.11.2022      | 8.33             | NA                                               | NA        | NA       | NA                    | NA        | NA                                    |

The fastq files related to this samples where **removed manually form the pipeline** by moving the files into a separate subfolder "rejected reads" as the DADA2 Filtering and Trimming algorithm does not create the filtered fastq files, causing an error in downstream in the pipeline. However, I am taking a look at the Quality Profile of these 6 samples to try and understand the reason they were left with cero reads:  

![Rejected forward reads](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_v4_v5_fwd.png)

![](/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_v4_v5_rev.png)

The quality of the reads is not great, making sense that they were rejected in the trimming process. Also, the number of reads is pretty low. Sample 241 corresponds to an exudate treatment and has a fairly small number of reads. It might be worth it to relax the trimming in the future, although the reverse reads for this sample would need a stricter truncation. 

These files were manually removed from the pipeline by moving them into a separate folder, which can be found here:
[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/rejected_reads]()

After removing and rerunning the pipeline the quality profile plots where explored once again, the report can be found in:

[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/Report/FilteredProfileForward.pdf]()
[/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens_raw_data/Report/FilteredProfileReverse.pdf]()


## Error rate inspection:

The error rate inspections seem to be fairly expected, however, not much information is available on interpreting such inspections.

### MaxEE = c(1,1):

Forward reads:
![Forward](/Users/carlosmartinez/Documents/Jens_raw_data/Errors_fwd_1_1.png)

Reverse reads:
![Reverse](/Users/carlosmartinez/Documents/Jens_raw_data/Errors_rev_1_1.png)

## Continuing the pipeline

Files were dereplicated, samples inferred, and the pair reads merged, sequence table built, and chimeras removed. 

## Survival table analysis: 

### MaxEE = c(1,1):
 
The survival table can be found here:
[/Users/carlosmartinez/Documents/Jens_raw_data/Survival_carlos_1_1.csv]()

#### Survival summary:

* Low reads <= 1000
* High reads >= 10000

| Category | Count |
|---|---|
| High Reads | 231 |
| Low Reads | 23 |
| Medium Reads | 38 |
| No Reads | 7 |

Survival plot: 

![](/Users/carlosmartinez/Documents/Jens_raw_data/Survival_Plot_1_1.png)

