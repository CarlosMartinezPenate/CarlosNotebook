#Differential Abundance Overview (Tar_Experiment)

Across the Tar_Experiment, a multi-method differential abundance analysis identified a subset of ASVs that were significantly affected by the treatments. The stringency of the methods varied: ALDEx2 detected no significant ASVs, while LEfSe identified 37. The DESeq2 and ANCOM-BC methods were more sensitive, detecting 238 and 310 ASVs, respectively, across both the free-living (FL) and particle-associated (PA) fractions. To ensure robust findings, ASVs supported by at least two methods with the same direction of change (enriched or depleted) were designated as strong biomarker candidates. Only one contrast met the stricter consensus of three methods: the time-zero vs. control contrast in the FL fraction.

##Exudate vs. Control
Exudate amendment drove distinct changes in both the free-living and particle-associated communities. 
###PA - 11_um
**In the particle-associated fraction by Genus****:**
![11_um](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_exudate_vs_control_Genus_11_um_min2.png), **PA by Order** ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_exudate_vs_control_Order_11_um_min2.png)__

11 ASVs were enriched and 25 were depleted. 

###FL - 0.22_um
**The free-living fraction by genus** ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_exudate_vs_control_Genus_sterivex_min2.png)showed a broader response, with 21 ASVs enriched and 45 depleted. **FL by Order:**![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_exudate_vs_control_Order_sterivex_min2.png)

Across both fractions, there was the depletion of the SAR11 clade,  with 8 ASVs depleted in the PA fraction and 24 ASVs depleted in the FL fraction. Conversely, both fractions saw an enrichment of Enterobacterales **[Pseudomonadales]**, Pseudomonadales, and Rhodobacterales.
###PA
In the particle-associated (PA; 11 µm) fraction, consensus identified 11 ASVs enriched and 25 ASVs depleted. In the free-living (FL; Sterivex) fraction, 21 ASVs were enriched and 45 were depleted. The dominant FL response was depletion of the SAR11 clade, accompanied by increases among Enterobacterales **[Pseudomonadales]** (8 ASVs), Flavobacteriales (7 ASVs), Pseudomonadales (5 ASVs), and Rhodobacterales (1 ASV). 

In the PA fraction, exudate amendment most commonly yielded enrichment of Pseudomonadales (7 ASVs) and increases in Enterobacterales **[Pseudomonadales]** and Rhodobacterales (2 ASVs each), alongside depletion of SAR11 (8 ASVs) and Pseudomonadales (5 ASVs). 

The largest effect sizes among upregulated ASVs were ASV866 (Thalassotalea; Colwelliaceae) with log2FC = 8.997, padj = 5.59×10⁻⁷, and ASV42 (Marinomonas; Marinomonadaceae) with log2FC = 5.947, padj = 9.48×10⁻⁸. Additional responders included ASV1830 (Profundimonas; Nitrincolaceae) with log2FC = 6.350, padj = 0.00537, and the Rhodobacterales member ASV1301 (Pseudophaeobacter; Rhodobacteraceae) with log2FC = 6.626, padj = 0.00239. 

Taxonomy note. Thalassotalea (Colwelliaceae) and Marinomonas (Marinomonadaceae) are commonly placed in Alteromonadales and Oceanospirillales, respectively; some result tables annotate Colwelliaceae and Marinomonadaceae under Enterobacterales/Pseudomonadales, reflecting classifier/database labels rather than current consensus taxonomy.

###FL
In the FL fraction, the highest fold-change was ASV589 (Glaciecola; Alteromonadaceae) with log2FC = 9.977 and padj = 2.25×10⁻⁹. Nevertheless, this strong signal was consistently strong across replicates. with z transformed relative abundances ranging from -0.210019598 to 2.031389779. Additional high-significance hits included ASV1521 (Marinomonas) with log2FC = 8.195 and p = 2.50×10⁻¹⁶, and ASV422 (Amphritea ceti; Nitrincolaceae) with log2FC = 9.189 and p = 3.99×10⁻¹⁶.The Colwelliacea ASVs (49,76,343) across the FL exudate replicate seem to have a replicate-specific effect, with z-transformed relative abundances varying across the 2 surviving replicates. with ASV343 displaying a strong signal (z-transformed relative abundance of 2.04124145) on one of the replicates. Likewise, the Flavobacteriaceae Dokdonia (ASVs 543,882, and 1068) show some heterogeneity among replicates, with (z-transformed relative abundance ranging from 	-0.198284669 to 1.920247833) for ASV882. In general, some ASVs within the replicates seem to be replicate-specific, while still being detected as significant for more than 2 methods. 

Exudate vs control (FL). The largest fold-change was ASV589 (Glaciecola; Alteromonadaceae) with log2FC = 9.977, padj = 2.25×10⁻⁹. Detection was consistent, but magnitude varied across replicates (z-transformed relative abundance range: −0.210 to 2.031). Additional high-significance hits included ASV1521 (Marinomonas; Marinomonadaceae) with log2FC = 8.195, p = 2.50×10⁻¹⁶, and ASV422 (Amphritea ceti; Nitrincolaceae) with log2FC = 9.189, p = 3.99×10⁻¹⁶. Several Colwelliaceae ASVs (ASV49, ASV76, ASV343) showed replicate-specific effects; for example, ASV343 reached z = 2.041 in one replicate, yet remained at z=-0.40824829 in the second replicate. Likewise, Flavobacteriaceae Dokdonia ASVs (ASV543, ASV882, ASV1068) exhibited among-replicate heterogeneity (e.g., ASV882 z-scores from −0.198 to 1.920). Overall, multiple ASVs displayed replicate-specific amplitude yet were still called significant by ≥2 methods, indicating robust but heterogeneous FL responses to the exudate amendment.

### Enterobacterales? 
#ASV1380
##BLAST

>ASV1389 | Bacteria; Proteobacteria; Alphaproteobacteria; Rhodobacterales; Rhodobacteraceae; Thalassobius; NA
ATACGGAGGGGGTTAGCGTTGTTCGGAATTACTGGGCGTAAAGCGTACGTAGGCGGACTAGTAAGTTAGGGGTGAAATCCCGGGGCTCAACCCCGGAACTGCCTTTAATACTGCTAGTCTTGAGTTCGAGAGAGGTGAGTGGAATTCCGAGTGTAGAGGTGAAATTCGTAGATATTCGGAGGAACACCAGTGGCGAAGGCGGCTCACTGGCTCGATACTGACGCTGAGGTACGAAAGTGTGGGGAGCAAACAGGATTAGATACCCTGGTAGTCCACACCGTAAACGATGAATGCCAGTCGTCGGGTAGCATGCTATTCGGTGACACACCTAACGGATTAAGCATTCCGCCTGGGGAGTACGGTCGCAAGATTAAA 
 
It seems this asv should be annotated new genus, Thasselovitas gelatinovorans, and is apparently known for being able to digest gelatine. It's an alphaproteobacterium. 

#ASV866 
 
 >ASV866 | Bacteria; Proteobacteria; Gammaproteobacteria; Enterobacterales; Colwelliaceae; Thalassotalea; NA
ATACGGAGGGTGCAAGCGTTAATCGGAATTACTGGGCGTAAAGCGTGCGTAGGTGGTTCATTAAGTCAGATGTGAAATCCCGGGGCTCAACCTCGGAACTGCATTTGAAACTGGTGTACTAGAGTATTGTAGAGGGTAGTGGAATTTCCAGTGTAGCGGTGAAATGCGTAGAGATTGGAAGGAACATCAGTGGCGAAGGCGGCTACCTGGACAAATACTGACACTGAGGCACGAAAGCGTGGGGAGCGAACAGGATTAGATACCCTGGTAGTCCACGCCGTAAACGATGTCAACTAGCCGTCTGTTTCCTTGAGAAGTGGGTGGCGTAGCTAACGCGCTAAGTTGACCGCCTGGGGAGTACGGCCGCAAGGTTAAA. it sees this sequence is close to an should Enterobacteriales its not adecuate for this asv, sholuld be 

>cellular organisms; Bacteria; Pseudomonadati; Pseudomonadota; Gammaproteobacteria; Alteromonadales; Colwelliaceae; Thalassotalea. 

Due to changes in 2021 most Enterobacterales ASVS are now in a new order: Alteromonadales. 
##Pyrene vs control. 
###PA
11_um:![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_pyrene_vs_control_Genus_11_um_min1.png)

11_um by order: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_pyrene_vs_control_Order_11_um_min1.png)
The only depletion supported by ≥2 methods (consensus) was Lacinutrix sp. (ASV2656). Non-consensus depletion (identified only by ANCOM-BC) included: (i) Cyanobacteria Synechococcus CC9902 (ASVs 4, 37, 141); (ii) Alphaproteobacteria typical of coastal particle/photoheterotrophs: Erythrobacter (ASVs 976, 2058), multiple Rhodobacteraceae (Yoonia–Loktanella 1510; Tateyamaria 1733; Roseovarius 2592), Rhodospirillales AEGEAN-169 (ASVs 69, 267, 376), and Caulobacterales (Maricaulis 1387); (iii) Gammaproteobacteria: Alcanivorax 1836 and Oleibacter marinus 757, plus Shewanellaceae/Psychrobium 566 and Arenicellales/Arenicella 1253; and (iv) Bacteroidota surface-polymer degraders: Flavobacteriaceae (Tenacibaculum 651; Aquimarina 1179; Aureicoccus marinus 1218) and Cyclobacteriaceae (Fabibacter 795). Also depleted were Marinimicrobia (SAR406) (241) and SAR86 Gammaproteobacteria (ASVs 111, 272, 324, 393). Replicate-level heterogeneity was evident in this fraction; nevertheless, z-score abundance patterns consistently indicated Rhodobacteraceae depletion. Across these groups, effects were modest, with log2FC < −2.7699540180962 for most ASVs.
###FL
FL by genus: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_pyrene_vs_control_Genus_sterivex_min1.png)

FL by Order: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_pyrene_vs_control_Order_sterivex_min1.png)

Consensus (≥2 methods) identified a single enriched feature: ASV64, an uncultured Pirellulaceae (Planctomycetota). Consensus depletions were broader: LEfSe + ANCOM-BC agreed on reduced Opitutales (e.g., Lentimonas ASV62), Synechococcales (e.g., Prochlorococcus/Synechococcus ASV2, ASV386), Rhodobacterales (Rhodobacteraceae ASV1040), and Marinimicrobia (SAR406; ASV60). DESeq2 + ALDEx2 independently agreed on depletion of the SAR11 clade (e.g., ASV584). Additional depleted signals observed in this comparison included SAR86 Gammaproteobacteria (ASV272) detected only by ANCOM-BC. Overall, FL responses to pyrene were characterized by a narrow consensus enrichment (single Pirellulaceae ASV) alongside multi-order consensus depletion spanning Verrucomicrobia (Opitutales), Cyanobacteria (Synechococcales), Alphaproteobacteria (Rhodobacterales, SAR11), and candidate phyla groups (Marinimicrobia).

##TAR
###PA
PA by Genus: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Genus_11_um_min2.png)
PA by Order![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Order_11_um_min2.png)


In the tar vs. control PA (11 µm) comparison, consensus (DESeq2 + ANCOM-BC) highlighted a focused Alteromonadaceae response: Glaciecola ASV9 (log2FC = 4.368, padj = 9.21×10⁻³), Glaciecola ASV67 (log2FC = 5.532, padj = 2.18×10⁻³), and an unclassified Alteromonadaceae ASV384 (log2FC = 5.188, padj = 6.00×10⁻³) were enriched. By contrast, a single Flavobacteriaceae feature showed consensus depletion: ASV2656 (unclassified Flavobacteriaceae) with log2FC = −5.154 (padj = 6.00×10⁻³). Taxonomy note: Alteromonadaceae are assigned to Alteromonadales (Gammaproteobacteria), even if some result tables label them under “Enterobacterales.”

##FL
FL by Genus: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Genus_sterivex_min2.png) 
FL by Order: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Order_sterivex_min2.png)

In the FL (Sterivex) fraction of the tar vs. control contrast, consensus (● DESeq2 + ◆ ANCOM-BC) depletion was observed for three sentinel lineages: SAR86 (ASV272), Candidatus Actinomarina (ASV464), and SAR11 Clade Ib (ASV584). Z-transformed abundances split cleanly by condition: controls were consistently positive (ASV272 ≈ 0.58–1.11; ASV464 ≈ 0.60–0.97; ASV584 ≈ 0.31–1.11), whereas the tar-amended replicates clustered near −1 (ASV272: −1.055; ASV464: −1.063; ASV584: −1.029).

##Tar_Exeperiment: L2FC heatmap

**Overview**:
The heatmap shows the log₂ fold-change values of different microbial taxa (ASVs) with different treatments compared to a control. Each column represents a treatment (SW for time-zero seawater, pyrene, tar, exudate), and each row represents an ASV classified by taxonomy. The control is the reference condition, so all ASVs have a fold-change of 0 in the control column (baseline). A positive log-fold-change in a treatment indicates that the taxon's abundance increased compared to the control, while a negative value indicates a decrease.The heatmap shows the log₂ fold-change values of different microbial taxa (ASVs) with different treatments compared to a control, calculated using DESeq2 function. Each column represents a treatment (SW for time-zero seawater, pyrene, tar, exudate), and each row represents an ASV classified by taxonomy. The unamended control is the reference condition, so all ASVs have a fold-change of 0 in the control column. A positive log-fold-change in a treatment indicates that the taxon's abundance increased compared to the control, while a negative value indicates a decrease. Each ASV is labeled with its taxonomy and symbols that indicate statistical significance and the direction of the log2 fold change. Consensus in the change direction among two or more methods suggests a robust change in that ASV for a specific treatment.

##FL.
FL by Genus:![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/deseq2_fc_heatmaps/deseq2_fc_heatmap_Genus_sterivex_min1_tar-pyrene-exudate-SW.png)
FL by Order:![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/deseq2_fc_heatmaps/deseq2_fc_heatmap_Order_11_um_min1_tar-pyrene-exudate-SW.png)
> 

##PA



