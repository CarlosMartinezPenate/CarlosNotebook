# ------------------------ 1. Loading Required Libraries ------------------------

# Install missing required packages via BiocManager
required_pkgs <- c("phyloseq", "DESeq2", "ggplot2", "ape", "vegan", "indicspecies", "dplyr")

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

BiocManager::install(required_pkgs)

# Load the libraries
lapply(required_pkgs, library, character.only = TRUE)

# ------------------------ 2. Loading and Exploring Data ------------------------

# Load ASV, Taxonomy, and Metadata tables from .csv files
asv_table <- read.csv("ASV_jenwavsforma.csv", row.names = 1, check.names = FALSE)
taxonomy_table <- read.csv("Taxonomy_asv_Jenmodultra.csv", row.names = 1)
metadata <- read.csv("metadata_jenclean.csv", row.names = 1)

# Check if ASV and Taxonomy tables have matching row names
stopifnot(all(rownames(asv_table) == rownames(taxonomy_table)))

# Explore metadata and check for missing values
summary(metadata)
head(asv_table)
head(taxonomy_table)

# Sample sizes by Station Treatment
table(metadata$Station_treatment)

# ------------------------ 3. Creating Phyloseq Object ------------------------

# Convert ASV and Taxonomy tables into phyloseq format
OTU <- otu_table(as.matrix(asv_table), taxa_are_rows = TRUE)
TAX <- tax_table(as.matrix(taxonomy_table))

# Convert Metadata into phyloseq-compatible format
META <- sample_data(metadata)

# Create the phyloseq object
physeq <- phyloseq(OTU, TAX, META)
print(physeq)

# ------------------------ 4. Data Exploration and Quality Checks ------------------------

# Summarize metadata
summary(sample_data(physeq))
table(sample_data(physeq)$Filter_Type)

# Summarize ASV counts per sample
sample_sums(physeq)

# Subset raw phyloseq object to specific treatments
physeq_subset_raw <- subset_samples(physeq, 
                                    Station_treatment %in% c("tar", "DDW", "pyrene", "control", "exudate", "SW") &
                                      Filter_Type %in% c("sterivex", "11_um"))

# Subset samples into control and experimental groups
physeq_subset_raw_ddw <- subset_samples(physeq_subset_raw, Station_treatment == "DDW")
physeq_subset_raw_exp <- subset_samples(physeq_subset_raw, Station_treatment %in% c("pyrene", "exudate","tar"))
physeq_subset_raw_pyr <- subset_samples(physeq_subset_raw, Station_treatment == "pyrene")
physeq_subset_raw_tar <- subset_samples(physeq_subset_raw, Station_treatment == "tar")
physeq_subset_raw_ctr <- subset_samples(physeq_subset_raw, Station_treatment == "control")
physeq_subset_raw_exu <- subset_samples(physeq_subset_raw, Station_treatment == "exudate")
physeq_subset_raw_sw <- subset_samples(physeq_subset_raw, Station_treatment == "SW")

sample_sums(physeq_subset_raw_exp)
sample_sums(physeq_subset_raw_ddw)
sample_sums(physeq_subset_raw_ctr)
sample_sums(physeq_subset_raw_sw)

# Plot ASV Richness (Shannon and Observed)
plot_richness(physeq_subset_raw, x = "Filter_Type", title = "raw", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_ddw, x = "Filter_Type", title = "DDW", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_exp, x = "Filter_Type", title = "Exp", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_pyr, x = "Filter_Type", title = "Pyrene", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_tar, x = "Filter_Type", title = "Tar", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_ctr, x = "Filter_Type", title = "Control", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_exu, x = "Filter_Type", title = "Exudate", measures = c("Shannon", "Observed"))
plot_richness(physeq_subset_raw_sw, x = "Filter_Type", title = "Exudate", measures = c("Shannon", "Observed"))


# Taxonomic distribution by Phylum
plot_bar(physeq_subset_raw_ddw, fill = "Phylum", title = "DDW") + facet_wrap(~ Filter_Type+Station_treatment)
plot_bar(physeq_subset_raw_exp, fill = "Phylum", title = "Exp") + facet_wrap(~ Filter_Type+Station_treatment)
plot_bar(physeq_subset_raw_pyr, fill = "Phylum", title = "Pyrene") + facet_wrap(~ Filter_Type+Station_treatment)
plot_bar(physeq_subset_raw_tar, fill = "Phylum", title = "Tar") + facet_wrap(~ Filter_Type+Station_treatment)
plot_bar(physeq_subset_raw_ctr, fill = "Phylum", title = "Control") + facet_wrap(~ Filter_Type+Station_treatment)
plot_bar(physeq_subset_raw_exu, fill = "Phylum", title = "Exudate") + facet_wrap(~ Filter_Type+Station_treatment)
plot_bar(physeq_subset_raw_sw, fill = "Phylum", title = "Seawater T0") + facet_wrap(~ Filter_Type+Station_treatment)


# ------------------------ Extract Top ASVs ------------------------

# Function to extract top 3 ASVs for each sample
get_top_asvs <- function(physeq_obj) {
  otu_counts <- otu_table(physeq_obj)
  apply(otu_counts, 2, function(counts_vector) {
    sorted_asvs <- sort(counts_vector, decreasing = TRUE)
    names(head(sorted_asvs, 3))
  })
}

# Apply the function to each physeq subset
top_asvs_per_sample_exp <- get_top_asvs(physeq_subset_raw_exp)
top_asvs_per_sample_ddw <- get_top_asvs(physeq_subset_raw_ddw)
top_asvs_per_sample_pyr <- get_top_asvs(physeq_subset_raw_pyr)
top_asvs_per_sample_tar <- get_top_asvs(physeq_subset_raw_tar)
top_asvs_per_sample_ctr <- get_top_asvs(physeq_subset_raw_ctr)
top_asvs_per_sample_exu <- get_top_asvs(physeq_subset_raw_exu)
top_asvs_per_sample_sw <- get_top_asvs(physeq_subset_raw_sw)

# Print top ASVs for each subset
print(top_asvs_per_sample_exp)
print(top_asvs_per_sample_ddw)
print(top_asvs_per_sample_pyr)
print(top_asvs_per_sample_tar)
print(top_asvs_per_sample_ctr)
print(top_asvs_per_sample_exu)
print(top_asvs_per_sample_sw)

# Function to prune taxa based on top ASVs
prune_top_asvs <- function(top_asvs, physeq_obj) {
  prune_taxa(top_asvs[top_asvs %in% taxa_names(physeq_obj)], physeq_obj)
}

# Prune taxa for each subset
top_asv_taxonomy_exp <- prune_top_asvs(top_asvs_per_sample_exp, physeq_subset_raw_exp)
top_asv_taxonomy_ddw <- prune_top_asvs(top_asvs_per_sample_ddw, physeq_subset_raw_ddw)
top_asv_taxonomy_pyr <- prune_top_asvs(top_asvs_per_sample_pyr, physeq_subset_raw_pyr)
top_asv_taxonomy_tar <- prune_top_asvs(top_asvs_per_sample_tar, physeq_subset_raw_tar)
top_asv_taxonomy_ctr <- prune_top_asvs(top_asvs_per_sample_ctr, physeq_subset_raw_ctr)
top_asv_taxonomy_exu <- prune_top_asvs(top_asvs_per_sample_exu, physeq_subset_raw_exu)
top_asv_taxonomy_sw <- prune_top_asvs(top_asvs_per_sample_sw, physeq_subset_raw_sw)

# Function to create a sorted abundance table
sort_abundance_table <- function(physeq_obj) {
  abundance_table <- psmelt(physeq_obj) %>%
    group_by(Sample, OTU, Genus) %>%
    summarize(Abundance = sum(Abundance), .groups = 'drop') %>%
    arrange(desc(Abundance))
  return(abundance_table)
}

# Create sorted abundance tables
sorted_taxonomy_exp <- sort_abundance_table(top_asv_taxonomy_exp)
sorted_taxonomy_ddw <- sort_abundance_table(top_asv_taxonomy_ddw)
sorted_taxonomy_pyr <- sort_abundance_table(top_asv_taxonomy_pyr)
sorted_taxonomy_tar <- sort_abundance_table(top_asv_taxonomy_tar)
sorted_taxonomy_ctr <- sort_abundance_table(top_asv_taxonomy_ctr)
sorted_taxonomy_exu <- sort_abundance_table(top_asv_taxonomy_exu)
sorted_taxonomy_sw <- sort_abundance_table(top_asv_taxonomy_sw)

# View the sorted tables
head(sorted_taxonomy_exp)
head(sorted_taxonomy_ddw)
head(sorted_taxonomy_pyr)
head(sorted_taxonomy_tar)
head(sorted_taxonomy_ctr)
head(sorted_taxonomy_exu)
head(sorted_taxonomy_sw)

# Save sorted tables to CSV
output_dir <- "/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/Results/"
write.csv(sorted_taxonomy_exp, file = paste0(output_dir, "sorted_top_asvs_exp.csv"))
write.csv(sorted_taxonomy_ddw, file = paste0(output_dir, "sorted_top_asvs_ddw.csv"))
write.csv(sorted_taxonomy_pyr, file = paste0(output_dir, "sorted_top_asvs_pyr.csv"))
write.csv(sorted_taxonomy_tar, file = paste0(output_dir, "sorted_top_asvs_tar.csv"))
write.csv(sorted_taxonomy_ctr, file = paste0(output_dir, "sorted_top_asvs_ctr.csv"))
write.csv(sorted_taxonomy_exu, file = paste0(output_dir, "sorted_top_asvs_exu.csv"))
write.csv(sorted_taxonomy_sw, file = paste0(output_dir, "sorted_top_asvs_sw.csv"))

# Combine top ASVs into a single CSV file
top_sorted_taxonomy_combined <- bind_rows(
  sorted_taxonomy_exp,
  sorted_taxonomy_ddw,
  sorted_taxonomy_pyr,
  sorted_taxonomy_tar,
  sorted_taxonomy_ctr,
  sorted_taxonomy_exu,
  sorted_taxonomy_sw
)
#test----start
#Combine all sorted taxonomy tables into one
combined_taxonomy <- bind_rows(
  sorted_taxonomy_exp %>% mutate(Treatment = "exp"),
  sorted_taxonomy_ddw %>% mutate(Treatment = "ddw"),
  sorted_taxonomy_pyr %>% mutate(Treatment = "pyr"),
  sorted_taxonomy_tar %>% mutate(Treatment = "tar"),
  sorted_taxonomy_ctr %>% mutate(Treatment = "ctr"),
  sorted_taxonomy_exu %>% mutate(Treatment = "exu"),
  sorted_taxonomy_sw %>% mutate(Treatment = "sw")
)

# Create a list of unique genera with their total abundances by treatment
unique_genera_by_treatment <- combined_taxonomy %>%
  group_by(Treatment, Genus) %>%
  summarize(Total_Abundance = sum(Abundance), .groups = 'drop') %>%
  arrange(Treatment, desc(Total_Abundance))

# Save unique genera for each treatment to separate CSV files
treatments <- unique(unique_genera_by_treatment$Treatment)

for (treatment in treatments) {
  treatment_data <- unique_genera_by_treatment %>%
    filter(Treatment == !!treatment)
  write.csv(treatment_data, file = paste0(output_dir, "unique_genera_", treatment, "_sorted_by_abundance.csv"), row.names = FALSE)
}

# View the top few rows of the unique genera by treatment data
head(unique_genera_by_treatment)
#---test-end

# Save the combined top ASVs
write.csv(top_sorted_taxonomy_combined, file = paste0(output_dir, "top_abundant_sorted_taxonomy_combined.csv"), row.names = TRUE,)


# Create a list of unique genera with their total abundances
unique_genera <- top_sorted_taxonomy_combined %>%
  group_by(Genus) %>%
  summarize(Total_Abundance = sum(Abundance), .groups = 'drop') %>%
  arrange(desc(Total_Abundance))

# Save the unique genera to CSV
write.csv(unique_genera, file = paste0(output_dir, "unique_genera_sorted_by_abundance.csv"), row.names = FALSE)

# View the top few unique genera
head(unique_genera)


#-----Generate rarefaction curves and save them-----

output_dir <- "/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/Results/" # Define your output directory

# For Raw subset
otu_matrix <- otu_table(physeq_subset_raw)
class(otu_matrix) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_raw.png"), width = 800, height = 600)
rarecurve(t(otu_matrix), step = 500, label = FALSE, main = "Rarefaction Curve - Raw Subset")
dev.off()

# For DDW subset
otu_matrix_subset_raw_ddw <- otu_table(physeq_subset_raw_ddw)
class(otu_matrix_subset_raw_ddw) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_ddw.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_ddw), step = 500, label = FALSE, main = "Rarefaction Curve - DDW Subset")
dev.off()

# For Experimental subset
otu_matrix_subset_raw_exp <- otu_table(physeq_subset_raw_exp)
class(otu_matrix_subset_raw_exp) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_experimental.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_exp), step = 500, label = FALSE, main = "Rarefaction Curve - Experimental Subset")
dev.off()

# For Pyrene subset
otu_matrix_subset_raw_pyr <- otu_table(physeq_subset_raw_pyr)
class(otu_matrix_subset_raw_pyr) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_pyrene.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_pyr), step = 500, label = FALSE, main = "Rarefaction Curve - Pyrene Subset")
dev.off()

# For Tar subset
otu_matrix_subset_raw_tar <- otu_table(physeq_subset_raw_tar)
class(otu_matrix_subset_raw_tar) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_tar.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_tar), step = 500, label = FALSE, main = "Rarefaction Curve - Tar Subset")
dev.off()

# For Control subset
otu_matrix_subset_raw_ctr <- otu_table(physeq_subset_raw_ctr)
class(otu_matrix_subset_raw_ctr) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_control.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_ctr), step = 500, label = FALSE, main = "Rarefaction Curve - Control Subset")
dev.off()

# For Exudate subset
otu_matrix_subset_raw_exu <- otu_table(physeq_subset_raw_exu)
class(otu_matrix_subset_raw_exu) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_exudate.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_exu), step = 500, label = FALSE, main = "Rarefaction Curve - Exudate Subset")
dev.off()

# For Saltwater subset
otu_matrix_subset_raw_sw <- otu_table(physeq_subset_raw_sw)
class(otu_matrix_subset_raw_sw) <- "matrix"
png(filename = paste0(output_dir, "rarefaction_curve_saltwater.png"), width = 800, height = 600)
rarecurve(t(otu_matrix_subset_raw_exu), step = 500, label = FALSE, main = "Rarefaction Curve - Exudate Subset")
dev.off()


# ------------------------ 5. Filtering and Normalization ------------------------

# Filter low-abundance ASVs (fewer than 10 reads)
physeq_subset_filtered <- prune_taxa(taxa_sums(physeq_subset_raw) > 10, physeq_subset_raw)
physeq_subset_filtered_ddw <- prune_taxa(taxa_sums(physeq_subset_raw_ddw) > 10, physeq_subset_raw_ddw)
physeq_subset_filtered_exp <- prune_taxa(taxa_sums(physeq_subset_raw_exp) > 10, physeq_subset_raw_exp)
physeq_subset_filtered_pyr <- prune_taxa(taxa_sums(physeq_subset_raw_pyr) > 10, physeq_subset_raw_pyr)
physeq_subset_filtered_tar <- prune_taxa(taxa_sums(physeq_subset_raw_tar) > 10, physeq_subset_raw_tar)
physeq_subset_filtered_ctr <- prune_taxa(taxa_sums(physeq_subset_raw_ctr) > 10, physeq_subset_raw_ctr)
physeq_subset_filtered_exu <- prune_taxa(taxa_sums(physeq_subset_raw_exu) > 10, physeq_subset_raw_exu)
physeq_subset_filtered_sw <- prune_taxa(taxa_sums(physeq_subset_raw_sw) > 10, physeq_subset_raw_sw)

# Remove samples with zero total abundance
physeq_subset_nonzero <- prune_samples(sample_sums(physeq_subset_filtered) > 0, physeq_subset_filtered)
physeq_subset_nonzero_ddw <- prune_samples(sample_sums(physeq_subset_filtered_ddw) > 0, physeq_subset_filtered_ddw)
physeq_subset_nonzero_exp <- prune_samples(sample_sums(physeq_subset_filtered_exp) > 0, physeq_subset_filtered_exp)
physeq_subset_nonzero_pyr <- prune_samples(sample_sums(physeq_subset_filtered_pyr) > 0, physeq_subset_filtered_pyr)
physeq_subset_nonzero_tar <- prune_samples(sample_sums(physeq_subset_filtered_tar) > 0, physeq_subset_filtered_tar)
physeq_subset_nonzero_ctr <- prune_samples(sample_sums(physeq_subset_filtered_ctr) > 0, physeq_subset_filtered_ctr)
physeq_subset_nonzero_exu <- prune_samples(sample_sums(physeq_subset_filtered_exu) > 0, physeq_subset_filtered_exu)
physeq_subset_nonzero_sw <- prune_samples(sample_sums(physeq_subset_filtered_sw) > 0, physeq_subset_filtered_sw)

# Normalize by relative abundance
physeq_subset_rel <- transform_sample_counts(physeq_subset_nonzero, function(x) x / sum(x))
physeq_subset_rel_ddw <- transform_sample_counts(physeq_subset_nonzero_ddw, function(x) x / sum(x))
physeq_subset_rel_exp <- transform_sample_counts(physeq_subset_nonzero_exp, function(x) x / sum(x))
physeq_subset_rel_pyr <- transform_sample_counts(physeq_subset_nonzero_pyr, function(x) x / sum(x))
physeq_subset_rel_tar <- transform_sample_counts(physeq_subset_nonzero_tar, function(x) x / sum(x))
physeq_subset_rel_ctr <- transform_sample_counts(physeq_subset_nonzero_ctr, function(x) x / sum(x))
physeq_subset_rel_exu <- transform_sample_counts(physeq_subset_nonzero_exu, function(x) x / sum(x))
physeq_subset_rel_sw <- transform_sample_counts(physeq_subset_nonzero_sw, function(x) x / sum(x))

# Check number of ASVs/OTUs
ntaxa(physeq_subset_rel)
summary(taxa_sums(physeq_subset_rel))

# ------------------------ 6. Alpha Diversity Analysis ------------------------

# Plot alpha diversity (Shannon and Simpson indices) for all subsets
plot_richness(physeq_subset_nonzero, x = "Filter_Type", title = "raw", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_ddw, x = "Filter_Type", title = "DDW", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_exp, x = "Filter_Type", title = "Exp", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_pyr, x = "Filter_Type", title = "Pyrene", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_tar, x = "Filter_Type", title = "Tar", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_ctr, x = "Filter_Type", title = "Control", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_exu, x = "Filter_Type", title = "Exudates", measures = c("Shannon", "Simpson"))
plot_richness(physeq_subset_nonzero_sw, x = "Filter_Type", title = "Saltwater", measures = c("Shannon", "Simpson"))

# Wilcoxon test for alpha diversity (Shannon index) across subsets
sample_data(physeq_subset_nonzero)$Filter_Type <- factor(sample_data(physeq_subset_nonzero)$Filter_Type)
alpha_div <- estimate_richness(physeq_subset_nonzero, measures = c("Shannon"))

# Perform Wilcoxon test
wilcox.test(alpha_div$Shannon ~ sample_data(physeq_subset_nonzero)$Filter_Type)

# ------------------------ 7. Beta Diversity Analysis ------------------------

# Perform NMDS ordination (Bray-Curtis dissimilarity) for all subsets
ord_bray <- ordinate(physeq_subset_rel, method = "NMDS", distance = "bray")

# Plot NMDS ordination colored by Filter Type and Station treatment
plot_ordination(physeq_subset_rel, ord_bray, color = "Filter_Type") + geom_point(size = 3) + theme_minimal()
plot_ordination(physeq_subset_rel, ord_bray, color = "Station_treatment", shape = "Filter_Type") + geom_point(size = 3) + theme_minimal()

# Run PERMANOVA on Bray-Curtis dissimilarity matrix
dist_bray <- phyloseq::distance(physeq_subset_rel, method = "bray")
adonis_result <- adonis2(dist_bray ~ Filter_Type, data = data.frame(sample_data(physeq_subset_rel)))
print(adonis_result)

# ------------------------ 8. Differential Abundance Analysis (DESeq2) ------------------------

# Prepare phyloseq object for DESeq2 analysis
dds <- phyloseq_to_deseq2(physeq_subset_nonzero_exp, ~ Station_treatment)

# Estimate size factors using the 'poscounts' method (handles zero counts)
dds <- estimateSizeFactors(dds, type = "poscounts")

# Run DESeq2 analysis
dds <- DESeq(dds)

# Extract DESeq2 results
res <- results(dds)
head(res)

# Filter significant results (adjusted p-value < 0.05)
sig_res <- res[which(res$padj < 0.05),]
head(sig_res)

# Plot log fold change for significant taxa
plotMA(res, ylim = c(-5, 5))

# ------------------------ 9. Indicator Species Analysis ------------------------

# Indicator species analysis using Indicspecies

# For the full relative abundance subset
otu_table_df <- data.frame(t(otu_table(physeq_subset_rel)))
indval <- multipatt(otu_table_df, sample_data(physeq_subset_rel)$Station_treatment, func = "IndVal.g")
summary(indval)

# For DDW subset
otu_table_df_ddw <- data.frame(t(otu_table(physeq_subset_rel_ddw)))
indval_ddw <- multipatt(otu_table_df_ddw, sample_data(physeq_subset_rel_ddw)$Station_treatment, func = "IndVal.g")
summary(indval_ddw)

# For Exp subset
otu_table_df_exp <- data.frame(t(otu_table(physeq_subset_rel_exp)))
indval_exp <- multipatt(otu_table_df_exp, sample_data(physeq_subset_rel_exp)$Station_treatment, func = "IndVal.g")
summary(indval_exp)

# For Pyrene subset
otu_table_df_pyr <- data.frame(t(otu_table(physeq_subset_rel_pyr)))
indval_pyr <- multipatt(otu_table_df_pyr, sample_data(physeq_subset_rel_pyr)$Station_treatment, func = "IndVal.g")
summary(indval_pyr)

# For Tar subset
otu_table_df_tar <- data.frame(t(otu_table(physeq_subset_rel_tar)))
indval_tar <- multipatt(otu_table_df_tar, sample_data(physeq_subset_rel_tar)$Station_treatment, func = "IndVal.g")
summary(indval_tar)

# For Control subset
otu_table_df_ctr <- data.frame(t(otu_table(physeq_subset_rel_ctr)))
indval_ctr <- multipatt(otu_table_df_ctr, sample_data(physeq_subset_rel_ctr)$Station_treatment, func = "IndVal.g")
summary(indval_ctr)

# For Control subset
otu_table_df_exu <- data.frame(t(otu_table(physeq_subset_rel_exu)))
indval_exu <- multipatt(otu_table_df_ctr, sample_data(physeq_subset_rel_exu)$Station_treatment, func = "IndVal.g")
summary(indval_ctr)

# ------------------------ 10. Environmental Correlation (CCA) ------------------------

# Canonical Correspondence Analysis (CCA)
ord_cca <- ordinate(physeq_subset_rel, method = "CCA", formula = ~ Filter_Type + Station_treatment)

# Plot CCA ordination
plot_ordination(physeq_subset_rel, ord_cca, color = "Station_treatment") +
  geom_point(size = 3) +
  theme_minimal()

# Perform PCoA ordination (Bray-Curtis dissimilarity)
ord_pcoa <- ordinate(physeq_subset_nonzero, method = "PCoA", distance = "bray")
plot_ordination(physeq_subset_nonzero, ord_pcoa, color = "Station_treatment") +
  geom_point(size = 3) +
  theme_minimal()

# Generate heatmaps for subsets
plot_heatmap(physeq_subset_nonzero_ddw, method = "NMDS", distance = "bray", taxa.label = "Genus", title="DDW", sample.label = "Station_treatment")
plot_heatmap(physeq_subset_nonzero_exp, method = "NMDS", distance = "bray", taxa.label = "Genus", title="Exp",sample.label = "Station_treatment")
plot_heatmap(physeq_subset_nonzero_pyr, method = "NMDS", distance = "bray", taxa.label = "Genus", title="Pyrene",sample.label = "Station_treatment")
plot_heatmap(physeq_subset_nonzero_tar, method = "NMDS", distance = "bray", taxa.label = "Genus", title="Tar",sample.label = "Station_treatment")
plot_heatmap(physeq_subset_nonzero_ctr, method = "NMDS", distance = "bray", taxa.label = "Genus", title="Control",sample.label = "Station_treatment")
plot_heatmap(physeq_subset_nonzero_exu, method = "NMDS", distance = "bray", taxa.label = "Genus", title="Exudates",sample.label = "Station_treatment")
plot_heatmap(physeq_subset_nonzero_sw, method = "NMDS", distance = "bray", taxa.label = "Genus", title="Saltwater",sample.label = "Station_treatment")

# ------------------------ Final Data Extraction and Plot Saving ------------------------

# Directory to save the plots and data
output_dir <- "/Users/carlosmartinez/Documents/Scholaship BIO/Vampire/Jens Data/Results/"  # Update with your desired output path

# Ensure the directory exists
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# ------------------------ 1. Saving ASV richness plots ------------------------

ggsave(filename = paste0(output_dir, "asv_richness_raw.png"), 
       plot = plot_richness(physeq_subset_raw, x = "Filter_Type", title = "ASV Richness - Raw", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_ddw.png"), 
       plot = plot_richness(physeq_subset_raw_ddw, x = "Filter_Type", title = "ASV Richness - DDW", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_exp.png"), 
       plot = plot_richness(physeq_subset_raw_exp, x = "Filter_Type", title = "ASV Richness - Experimental", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_pyrene.png"), 
       plot = plot_richness(physeq_subset_raw_pyr, x = "Filter_Type", title = "ASV Richness - Pyrene", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_tar.png"), 
       plot = plot_richness(physeq_subset_raw_tar, x = "Filter_Type", title = "ASV Richness - Tar", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_control.png"), 
       plot = plot_richness(physeq_subset_raw_ctr, x = "Filter_Type", title = "ASV Richness - Control", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_exudate.png"), 
       plot = plot_richness(physeq_subset_raw_exu, x = "Filter_Type", title = "ASV Richness - Exudate", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "asv_richness_sw.png"), 
       plot = plot_richness(physeq_subset_raw_sw, x = "Filter_Type", title = "ASV Richness - Saltwater", 
                            measures = c("Shannon", "Observed")),
       width = 8, height = 6)
# ------------------------ 2. Saving taxonomic distribution plots by Phylum ------------------------

ggsave(filename = paste0(output_dir, "taxonomic_distribution_ddw.png"), 
       plot = plot_bar(physeq_subset_rel_ddw, fill = "Phylum", title = "Taxonomic Distribution - DDW") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 12, height = 12, dpi = 300)

ggsave(filename = paste0(output_dir, "taxonomic_distribution_exp.png"), 
       plot = plot_bar(physeq_subset_rel_exp, fill = "Phylum", title = "Taxonomic Distribution - Experimental") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 24, height = 12, dpi = 300)

ggsave(filename = paste0(output_dir, "taxonomic_distribution_pyrene.png"), 
       plot = plot_bar(physeq_subset_rel_pyr, fill = "Phylum", title = "Taxonomic Distribution - Pyrene") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 24, height = 12, dpi = 300)

ggsave(filename = paste0(output_dir, "taxonomic_distribution_tar.png"), 
       plot = plot_bar(physeq_subset_rel_tar, fill = "Phylum", title = "Taxonomic Distribution - Tar") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 24, height = 12, dpi = 300)

ggsave(filename = paste0(output_dir, "taxonomic_distribution_control.png"), 
       plot = plot_bar(physeq_subset_rel_ctr, fill = "Phylum", title = "Taxonomic Distribution - Control") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 24, height = 12, dpi = 300)

ggsave(filename = paste0(output_dir, "taxonomic_distribution_exudate.png"), 
       plot = plot_bar(physeq_subset_rel_exu, fill = "Phylum", title = "Taxonomic Distribution - Exudate") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 24, height = 12, dpi = 300)

ggsave(filename = paste0(output_dir, "taxonomic_distribution_saltwater.png"), 
       plot = plot_bar(physeq_subset_rel_sw, fill = "Phylum", title = "Taxonomic Distribution - Saltwater") + 
         facet_wrap(~ Filter_Type+Station_treatment),
       width = 24, height = 12, dpi = 300)

# ------------------------ 4. Saving NMDS and CCA ordination plots ------------------------

# NMDS ordination (Bray-Curtis)
ord_bray <- ordinate(physeq_subset_rel, method = "NMDS", distance = "bray")
ord_bray_exp <- ordinate(physeq_subset_rel_exp, method = "NMDS", distance = "bray")
ord_bray_ctr <- ordinate(physeq_subset_rel_ctr, method = "NMDS", distance = "bray")
ord_bray_ddw <- ordinate(physeq_subset_rel_ddw, method = "NMDS", distance = "bray")

ggsave(filename = paste0(output_dir, "ordination_nmds_bray_subset_rel_filter_type.png"),
       plot = plot_ordination(physeq_subset_rel, ord_bray, color = "Filter_Type") + 
         geom_point(size = 3) + theme_minimal()+labs(title = "Raw"),
       width = 8, height = 6)
ggsave(filename = paste0(output_dir, "ordination_nmds_bray_subset_rel_treatment.png"),
       plot_ordination(physeq_subset_rel, ord_bray, color = "Station_treatment", shape = "Filter_Type") + geom_point(size = 3) + theme_minimal()+labs(title = "Raw"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "ordination_nmds_bray_exp.png"),
       plot_ordination(physeq_subset_rel_exp, ord_bray_exp, color = "Station_treatment", shape = "Filter_Type") + geom_point(size = 3) + theme_minimal()+labs(title = "Exp"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "ordination_nmds_bray_ctr.png"),
       plot_ordination(physeq_subset_rel_ctr, ord_bray_ctr, color = "Station_treatment", shape = "Filter_Type") + geom_point(size = 3) + theme_minimal()+labs(title = "Ctr"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "ordination_nmds_bray_ddw.png"),
       plot_ordination(physeq_subset_rel_ddw, ord_bray_ddw, color = "Station_treatment", shape = "Filter_Type") + geom_point(size = 3) + theme_minimal()+labs(title = "DDW"),
       width = 8, height = 6)

# CCA ordination
ord_cca <- ordinate(physeq_subset_rel, method = "CCA", formula = ~ Filter_Type + Station_treatment)
ggsave(filename = paste0(output_dir, "ordination_cca.png"),
       plot = plot_ordination(physeq_subset_rel, ord_cca, color = "Station_treatment", shape = "Filter_Type") + 
         geom_point(size = 3) + theme_minimal()+labs(title = "Raw"),
       width = 8, height = 6)

ord_cca_exp <- ordinate(physeq_subset_rel_exp, method = "CCA", formula = ~ Filter_Type + Station_treatment)
ggsave(filename = paste0(output_dir, "ordination_cca_exp.png"),
       plot = plot_ordination(physeq_subset_rel_exp, ord_cca_exp, color = "Station_treatment", shape = "Filter_Type") + 
         geom_point(size = 3) + theme_minimal()+labs(title = "Exp"),
       width = 8, height = 6)

ord_cca_ctr <- ordinate(physeq_subset_rel_ctr, method = "CCA", formula = ~ Filter_Type + Station_treatment)
ggsave(filename = paste0(output_dir, "ordination_cca_ctr.png"),
       plot = plot_ordination(physeq_subset_rel, ord_cca_ctr, color = "Station_treatment", shape = "Filter_Type") + 
         geom_point(size = 3) + theme_minimal()+labs(title = "Ctr"),
       width = 8, height = 6)

ord_cca_ddw <- ordinate(physeq_subset_rel_ddw, method = "CCA", formula = ~ Filter_Type + Station_treatment)
ggsave(filename = paste0(output_dir, "ordination_cca_ddw.png"),
       plot = plot_ordination(physeq_subset_rel_ddw, ord_cca_ddw, color = "Station_treatment", shape = "Filter_Type") + 
         geom_point(size = 3) + theme_minimal()+labs(title = "DDW"),
       width = 8, height = 6)


# ------------------------ 5. Saving DESeq2 results ------------------------

# Prepare phyloseq object for DESeq2 analysis
dds <- phyloseq_to_deseq2(physeq_subset_nonzero, ~ Filter_Type)
dds <- DESeq(dds)

# Extract and save DESeq2 results
res <- results(dds)
write.csv(as.data.frame(res), file = paste0(output_dir, "deseq2_results.csv"))

# ------------------------ 6. Saving top 3 abundant ASVs for each treatment ------------------------

# Save the top ASVs per treatment
taxonomy_data_exp <- tax_table(top_asv_taxonomy_exp)
taxonomy_df_exp <- as.data.frame(taxonomy_data_exp)
write.csv(taxonomy_df_exp, file = paste0(output_dir, "top_asvs_experiment.csv"))

taxonomy_data_ddw <- tax_table(top_asv_taxonomy_ddw)
taxonomy_df_ddw <- as.data.frame(taxonomy_data_ddw)
write.csv(taxonomy_df_ddw, file = paste0(output_dir, "top_asvs_ddw.csv"))

taxonomy_data_pyr <- tax_table(top_asv_taxonomy_pyr)
taxonomy_df_pyr <- as.data.frame(taxonomy_data_pyr)
write.csv(taxonomy_df_pyr, file = paste0(output_dir, "top_asvs_pyrene.csv"))

taxonomy_data_tar <- tax_table(top_asv_taxonomy_tar)
taxonomy_df_tar <- as.data.frame(taxonomy_data_tar)
write.csv(taxonomy_df_tar, file = paste0(output_dir, "top_asvs_tar.csv"))

taxonomy_data_ctr <- tax_table(top_asv_taxonomy_ctr)
taxonomy_df_ctr <- as.data.frame(taxonomy_data_ctr)
write.csv(taxonomy_df_ctr, file = paste0(output_dir, "top_asvs_control.csv"))

taxonomy_data_exu <- tax_table(top_asv_taxonomy_exu)
taxonomy_df_exu <- as.data.frame(taxonomy_data_exu)
write.csv(taxonomy_df_exu, file = paste0(output_dir, "top_asvs_exudate.csv"))

taxonomy_data_sw <- tax_table(top_asv_taxonomy_sw)
taxonomy_df_sw <- as.data.frame(taxonomy_data_sw)
write.csv(taxonomy_df_exu, file = paste0(output_dir, "top_asvs_exudate.csv"))

# Combine top ASVs into a single CSV file
top_asvs_combined <- bind_rows(
  taxonomy_df_exp,
  taxonomy_df_ddw,
  taxonomy_df_pyr,
  taxonomy_df_tar,
  taxonomy_df_ctr,
  taxonomy_df_exu,
  taxonomy_df_sw
)

# Save the combined top ASVs
write.csv(top_asvs_combined, file = paste0(output_dir, "top_abundant_asvs_combined.csv"), row.names = FALSE)

# ------------------------ 7. Saving Heatmap plots for each subset ------------------------

ggsave(filename = paste0(output_dir, "heatmap_ddw.png"),
       plot = plot_heatmap(physeq_subset_filtered_ddw, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - DDW", sample.label = "Station_treatment"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "heatmap_exp.png"),
       plot = plot_heatmap(physeq_subset_filtered_exp, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - Experimental", sample.label = "Station_treatment"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "heatmap_pyrene.png"),
       plot = plot_heatmap(physeq_subset_filtered_pyr, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - Pyrene", sample.label = "Station_treatment"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "heatmap_tar.png"),
       plot = plot_heatmap(physeq_subset_filtered_tar, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - Tar", sample.label = "Station_treatment"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "heatmap_control.png"),
       plot = plot_heatmap(physeq_subset_filtered_ctr, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - Control", sample.label = "Station_treatment"),
       width = 8, height = 6)

ggsave(filename = paste0(output_dir, "heatmap_exudate.png"),
       plot = plot_heatmap(physeq_subset_filtered_exu, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - Exudate", sample.label = "Station_treatment"),
       width = 8, height = 6)
ggsave(filename = paste0(output_dir, "heatmap_saltwater.png"),
       plot = plot_heatmap(physeq_subset_filtered_sw, method = "NMDS", distance = "bray", 
                           taxa.label = "Genus", title = "Heatmap - Exudate", sample.label = "Station_treatment"),
       width = 8, height = 6)

# ------------------------ End of Data Extraction ------------------------

