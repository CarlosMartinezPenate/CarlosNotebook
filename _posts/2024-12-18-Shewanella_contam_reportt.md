# Analysis Report

## *In silico* Shewanella and Acinetobacter ASV read frequency

### Objective
Identify if the Shewanella and Acinetobacter Genera found in the DADA2 annotation of the "Tar Experiment" can be identified as contaminants. 

### Methodology 

[decontam](https://benjjneb.github.io/decontam/vignettes/decontam_intro.html) package in R, version 1.24.0 

### Results:

|![](/Users/carlosmartinez/Documents/Tar_experiment/Shewanella_read_frequency_main.png)|
|:--:|
|Shewanella: high number of reads|

### Discussion:

* ASV 10,8 and 89 show a "clear" contaminant tendency (follow the red trend line) except for ASV 
* ASV 852 shows a "not so clear" contaminant tendency
* The decontam package does not identify any of the Shewanella ASV as contaminants using the frequency method (threshold = 0.05) 
* Using the prevalence method (threshold = 0.07) ASVs 10, 89, 709, 862 were identifed, however it also identifies other ASVS as contamination
* [Frequency table for Shewanella](/Users/carlosmartinez/Documents/Tar_experiment/Results/freq.shewanella.csv)
* [Prevalence table for Shewanella](/Users/carlosmartinez/Documents/Tar_experiment/Results/prev.shewanella.csv)
* [All identified contaminants by frequency](/Users/carlosmartinez/Documents/Tar_experiment/Results/freq.contamns.csv)
* [All identified contaminants by prevalence](/Users/carlosmartinez/Documents/Tar_experiment/Results/prev.contamns.csv)

