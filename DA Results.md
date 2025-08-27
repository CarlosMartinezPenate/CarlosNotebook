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

Exudate vs control (FL). The largest fold-change was ASV589 (Glaciecola; Alteromonadaceae) with log2FC = 9.977, padj = 2.25×10⁻⁹. Detection was consistent, but magnitude varied across replicates (z-transformed relative abundance range: −0.210 to 2.031). Additional high-significance hits included ASV1521 (Marinomonas; Marinomonadaceae) with log2FC = 8.195, p = 2.50×10⁻¹⁶, and ASV422 (Amphritea ceti; Nitrincolaceae) with log2FC = 9.189, p = 3.99×10⁻¹⁶. Several Colwelliaceae ASVs (ASV49, ASV76, ASV343) showed replicate-specific effects; for example, ASV343 reached z = 2.041 in one replicate, yet remained at z=-0.40824829 in the second replicate. Likewise, Flavobacteriaceae Dokdonia ASVs (ASV543, ASV882, ASV1068) exhibited among-replicate heterogeneity (, ASV882 z-scores from −0.198 to 1.920). Overall, multiple ASVs displayed replicate-specific amplitude yet were still called significant by ≥2 methods, indicating robust but heterogeneous FL responses to the exudate amendment.

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

Consensus (≥2 methods) identified a single enriched feature: ASV64, an uncultured Pirellulaceae (Planctomycetota). Consensus depletions were broader: LEfSe + ANCOM-BC agreed on reduced Opitutales (, Lentimonas ASV62), Synechococcales (, Prochlorococcus/Synechococcus ASV2, ASV386), Rhodobacterales (Rhodobacteraceae ASV1040), and Marinimicrobia (SAR406; ASV60). DESeq2 + ALDEx2 independently agreed on depletion of the SAR11 clade (, ASV584). Additional depleted signals observed in this comparison included SAR86 Gammaproteobacteria (ASV272) detected only by ANCOM-BC. Overall, FL responses to pyrene were characterized by a narrow consensus enrichment (single Pirellulaceae ASV) alongside multi-order consensus depletion spanning Verrucomicrobia (Opitutales), Cyanobacteria (Synechococcales), Alphaproteobacteria (Rhodobacterales, SAR11), and candidate phyla groups (Marinimicrobia).

##TAR
###PA
PA by Genus: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Genus_11_um_min2.png)
PA by Order![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Order_11_um_min2.png)

In the tar vs. control PA (11 µm) comparison, consensus (DESeq2 + ANCOM-BC) highlighted a focused Alteromonadaceae response: Glaciecola ASV9 (log2FC = 4.368, padj = 9.21×10⁻³), Glaciecola ASV67 (log2FC = 5.532, padj = 2.18×10⁻³), and an unclassified Alteromonadaceae ASV384 (log2FC = 5.188, padj = 6.00×10⁻³) were enriched. By contrast, a single Flavobacteriaceae feature showed consensus depletion: ASV2656 (unclassified Flavobacteriaceae) with log2FC = −5.154 (padj = 6.00×10⁻³). Taxonomy note: Alteromonadaceae are assigned to Alteromonadales (Gammaproteobacteria), even if some result tables label them under “Enterobacterales.”

##FL
FL by Genus: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Genus_sterivex_min2.png) 
FL by Order: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/directional_heatmaps/directional_heatmap_tar_vs_control_Order_sterivex_min2.png)

In the FL (Sterivex) fraction of the tar vs. control contrast, consensus (● DESeq2 + ◆ ANCOM-BC) depletion was observed for three sentinel lineages: SAR86 (ASV272), Candidatus Actinomarina (ASV464), and SAR11 Clade Ib (ASV584). Z-transformed abundances split cleanly by condition: controls were consistently positive (ASV272 ≈ 0.58–1.11; ASV464 ≈ 0.60–0.97; ASV584 ≈ 0.31–1.11), whereas the tar-amended replicates clustered near −1 (ASV272: −1.055; ASV464: −1.063; ASV584: −1.029).

##Tar_Exeperiment: Biomarker Candidates by Treatment and Size Fraction
**Overview**:
The heatmap shows the log₂ fold-change values of different microbial taxa (ASVs) with different treatments compared to a control. Each column represents a treatment (SW for time-zero seawater, pyrene, tar, exudate), and each row represents an ASV classified by taxonomy. The control is the reference condition, so all ASVs have a fold-change of 0 in the control column (baseline). A positive log-fold-change in a treatment indicates that the taxon's abundance increased compared to the control, while a negative value indicates a decrease.The heatmap shows the log₂ fold-change values of different microbial taxa (ASVs) with different treatments compared to a control, calculated using DESeq2 function. Each column represents a treatment (SW for time-zero seawater, pyrene, tar, exudate), and each row represents an ASV classified by taxonomy. The unamended control is the reference condition, so all ASVs have a fold-change of 0 in the control column. A positive log-fold-change in a treatment indicates that the taxon's abundance increased compared to the control, while a negative value indicates a decrease. Each ASV is labeled with its taxonomy and symbols that indicate statistical significance and the direction of the log2 fold change. Consensus in the change direction among two or more methods suggests a robust change in that ASV for a specific treatment.

#####log2FC heatmaps
FL by Genus:![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/deseq2_fc_heatmaps/deseq2_fc_heatmap_Genus_sterivex_min1_tar-pyrene-exudate-SW.png)
PA by Genus:![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/deseq2_fc_heatmaps/deseq2_fc_heatmap_Genus_11_um_min1_tar-pyrene-exudate-SW.png)
##### zscore transformed ra heatmaps:

FL: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/complex_heatmaps_combined/complex_heatmap_Genus_zscore_sterivex_min1_tar-pyrene-exudate-SW.png)
PA: ![](/Users/carlosmartinez/Documents/GitHub/DA_Pipeline/DA_Pipeline/results/complex_heatmaps_combined/complex_heatmap_Genus_zscore_11_um_min1_tar-pyrene-exudate-SW.png)

The heatmaps show the log₂ fold-changes of Amplicon Sequence Variants (ASVs) under each treatment (tar, pyrene, exudate, and SW control) compared to the control. The symbols indicate which methods identified each ASV as significant (DESeq2 = "●", ALDEx2 = "■", LEfSe = "▲", ANCOMBC = "◆" ). ASVs are included when at least one method detects a significant change.  The SW (seawater-only control) group also experienced significant changes due to bottle effects, which is critical for distinguishing true treatment biomarkers from general incubation effects. 

###Tar

####11 µm Particle-Associated Fraction

Relatively few ASVs responded significantly to the tar treatment in the large size fraction (9 ASVs total, of which 4 were unique to tar). Notably, two ASVs affiliated with the family Alteromonadaceae (genus Glaciecola in one case) were strongly enriched in tar-amended samples exclusively. These showed high positive log₂ fold-changes (~4–5.5) and were detected by two methods (DESeq2 and LEfSe). For example, Glaciecola ASV67 increased ~5.5-fold under tar (●↑◆↑ in the heatmap, indicating detection by two methods). Members of the Alteromonadaceae, including Glaciecola, are often copiotrophic marine bacteria reported from hydrocarbon-amended environments. Their enrichment suggests a specific response to tar-derived carbon. These Alteromonadaceae ASVs were not flagged in any other treatment, making them promising tar-specific biomarkers.

In contrast, a few taxa showed tar-specific depletions. For instance, one Colwellia ASV was uniquely decreased under tar (log₂ fold ≈ −1.9, by one method). However, single-method detections are less robust. Overall, the tar signature in this fraction is an enrichment of certain hydrocarbon-associated or opportunistic heterotrophs. This pattern is consistent with known oil-degrader behavior—, Marinobacter, a generalist hydrocarbon degrader, appeared in the tar treatment (see sterivex fraction below). The relatively low number of exclusive responders in tar–11 µm suggests that some organisms enriched by tar were also stimulated by other treatments (or by general bottle/nutrient effects), underscoring the importance of using the SW control as a filter.

####Sterivex (0.2 µm Free-Living Fraction)

In the free-living fraction, about 9 ASVs were significantly changed in tar, but only one was unique to tar alone. That lone tar-specific responder is noteworthy: an ASV of genus Marinobacter bloomed in tar-treated samples (log₂ fold-change ~8, ~256× increase). This ASV was marked by one method (◆↑ in the heatmap), indicating LEfSe identified it as a significant tar biomarker. Despite single-method support, the magnitude of increase and exclusivity to tar make Marinobacter a compelling candidate indicator of oil contamination. Marinobacter are widely known to degrade aliphatic and aromatic hydrocarbons and often proliferate in oil-impacted environments.

Apart from Marinobacter, other tar-responsive ASVs in the sterivex fraction tended to overlap with responses in the exudate or SW groups (hence not exclusive). For example, some typical surface-ocean taxa that decreased under tar (potentially due to disturbance or toxicity) also declined in the SW control or exudate addition, indicating these signals are not tar-specific. In summary, tar-specific biomarkers appear limited to a few hydrocarbon-associated taxa (Alteromonadaceae, including Glaciecola in particles, and Marinobacter in free-living plankton). These organisms were enriched by tar alone (with multi-method support in the particle fraction) and did not significantly change in the other treatments, highlighting their potential as diagnostic indicators of oil/tar contamination.

⸻

###Pyrene Treatment (PAH Contamination)

####11 µm Particle-Associated Fraction

The pyrene (polycyclic aromatic hydrocarbon) treatment induced relatively modest changes. In the 11 µm fraction, 19 ASVs were significant for pyrene vs. control, but only 5 were uniquely associated with pyrene, and none had more than one method’s support. In general, pyrene exposure tended to suppress certain taxa rather than enrich many. For example, Oleibacter (a hydrocarbon-associated genus) showed a pyrene-specific decrease (log₂ fold ≈ −0.9, ◆↓). Similarly, Aquimarina (Bacteroidetes) and Roseovarius (Rhodobacteraceae) each declined under pyrene (by one method). These declines suggest that pyrene—being a toxic PAH—had an inhibitory effect on some bacteria otherwise stable in control conditions. It is notable that Oleibacter, despite hydrocarbon associations, did not bloom with pyrene; instead it dropped, possibly because pyrene is not readily degraded by that organism or because toxicity outweighed any nutritional benefit.

One ASV affiliated with SAR11 Clade II (an alphaproteobacterial oligotroph) showed a modest increase unique to pyrene (log₂ fold ≈ +0.94, single-method). Given the small magnitude and single-method detection, this is a tentative signal. No pyrene-exclusive ASV achieved ≥2-method support, indicating a lack of highly robust biomarkers in this fraction. Overall, pyrene–11 µm shows little enrichment of specialized PAH degraders and mostly subtle declines in sensitive taxa. Potential pyrene indicators are therefore limited to consistent decreases (, Oleibacter or Aquimarina), which remain weaker than the positive enrichments seen in other treatments.

####Sterivex Free-Living Fraction

In the sterivex fraction, only 8 ASVs were significantly affected by pyrene, with 2 unique to pyrene (both single-method). As in the particle fraction, depletions dominated. For instance, a Lentimonas ASV (Flavobacteriaceae) was uniquely decreased under pyrene (▲↓). Another was an unclassified Marinimicrobia (SAR406) ASV that dropped with pyrene. These taxa did not change significantly in tar, exudate, or SW, suggesting pyrene-linked specificity. Notably, no Marinobacter, Alcanivorax, or recognized PAH degraders were significantly enriched by pyrene in this fraction, again indicating limited microbial utilization of pyrene under the experimental conditions.

Overall, no multi-method consensus biomarkers emerged for pyrene in either fraction, reflecting relatively small or inconsistent shifts. The most plausible candidates are ASVs that consistently decreased only in the pyrene treatment (, Lentimonas or Oleibacter). Because many pyrene-affected ASVs also showed trends in the SW control, caution is warranted: several changes under pyrene overlapped with general bottle effects, implying a low signal-to-noise ratio for this treatment.

⸻

###Exudate Treatment (Organic Enrichment)

####11 µm Particle-Associated Fraction

The exudate treatment caused extensive community shifts in the particle-associated fraction. A total of 71 ASVs differed significantly from control, and 28 were unique to exudate (many with multi-method support). This indicates that labile organic carbon strongly altered the attached community. Copiotrophic Gammaproteobacteria bloomed: for example, Marinomonas (Oceanospirillales) and Pseudoalteromonas each had an ASV that increased exclusively in exudate (log₂ fold-changes ~3.5–6, ●↑◆↑). These genera are fast-growing heterotrophs often linked to phytoplankton and organic-particle degradation, and are frequently enriched by algal or phytoplankton exudates.

Additional increases in exudate–11 µm included Amphritea and Vibrio (Vibrionaceae). For instance, a Vibrio ASV was exclusively enriched in exudate (detected by one method in 11 µm, more strongly in sterivex). Vibrio spp. are classic copiotrophs that thrive on algal sugars and DOM, matching expectations for exudate-amended incubations. In contrast, oligotrophic and nitrifying organisms declined markedly. A prime example is Candidatus Nitrosopelagicus (ammonia-oxidizing archaeon): one ASV dropped ~4.2-fold in exudate (●↓◆↓). Such inhibition is consistent with organic-carbon additions favoring heterotrophs over autotrophic nitrifiers. SAR11 clade members and other background oligotrophs also decreased, likely outcompeted or diluted by fast-growing bacteria.

In summary, the 11 µm exudate response features a bloom of particle-associated copiotrophs (Alteromonadales, Vibrionales, etc.) and a crash of oligotrophs/chemolithotrophs. Biomarker candidates for exudate (particle fraction) include strongly enriched Marinomonas and Pseudoalteromonas ASVs (multi-method, high fold-change) and the pronounced depletion of Nitrosopelagicus—signals not triggered by tar, pyrene, or SW.

####Sterivex Free-Living Fraction

Exudate had an impact on the free-living bacterial community. This was the most responsive category overall: 131 ASVs changed significantly, with 95 exclusively significant to exudate—far more than any other treatment. Planktonic bacteria directly exposed to dissolved exudates showed a pronounced bloom-and-bust dynamic. Many ASVs bloomed, dominated by Gamma- and Alphaproteobacteria known to exploit DOC. For example, Marinomonas (ASV42) and Pseudoalteromonas (ASV43) were again top responders—each increasing ~6.3–6.4 log₂ fold (i.e., >80-fold), detected by two methods. Vibrio (ASV66) likewise increased (~4.0 log₂ fold, ●↑◆↑), consistent with Vibrionaceae flourishing on added organic matter. These genera appear exclusively under exudate in both fractions, supporting their role as exudate biomarkers.

Some less-expected patterns also appeared. Ascidiaceihabitans (Rhodobacteraceae) showed a large exclusive decrease (log₂ −5.14, ●↓◆↓), consistent with sensitivity to nutrient enrichment. Members of Oceanospirillales and Rhodobacterales generally increased; certain Flavobacteriia (, Polaribacter) also rose in the sterivex fraction, aligning with roles in polysaccharide consumption. Although no ASV reached 3-method consensus here, the abundance of 2-method, treatment-exclusive signals emphasizes specificity of the exudate effect: a broad bloom of diverse heterotrophs accompanied by a collapse of oligotrophs. For biomarker purposes, the most compelling candidates are the genera that reliably bloom only with exudate—Marinomonas, Pseudoalteromonas, Vibrio—observed in both fractions with high significance.

⸻

###SW Control (Bottle Effect)

####11 µm Particle-Associated Fraction

The SW (“seawater-only”) incubation revealed strong bottle effects. A large number of ASVs (71) changed significantly vs. the initial control, though only 26 were exclusive to SW. The heatmap shows both increases and decreases. Some opportunists increased even without amendments: for example, a Prochlorococcus MIT9313 ASV rose in SW (log₂ ~4.9, ●↑◆↑), possibly reflecting relative increases as other groups declined or nutrient release from cell lysis. The SAR86 clade also showed a SW-specific increase (, ASV179, +2.9 log₂, two methods), consistent with utilization of DOM released in closed bottles.

Conversely, many typically abundant microbes declined. Polaribacter dropped sharply (ASV160 log₂ ≈ −6.6, ●↓◆↓) uniquely in SW. Oleispira decreased ~−6.6 log₂ in SW (and even more in exudate), indicating poor performance without preferred substrates. Aliiglaciecola (Alteromonadaceae) also fell. These declines likely reflect die-off of slower-growing or substrate-limited organisms in confinement. The SW group therefore helps identify non-specific shifts; any ASV changing significantly in SW should be treated cautiously as a treatment biomarker.

#####Sterivex Free-Living Fraction

The SW sterivex fraction also changed (47 ASVs significant, 13 exclusive to SW). A few ASVs exhibited very strong consensus across all three methods in SW—something not seen elsewhere. For example, a Planctomycetes genus (Blastopirellula) increased (log₂ ~3.6; ●↑▲↑◆↑) and a SAR11 Clade Ia ASV (ASV868) rose modestly (log₂ ~0.87; triple-method support). These consistent shifts underscore that some of the strongest statistical signals reflect bottle effects rather than amendments. Other SW sterivex changes included decreases in ultraoligotrophs such as Candidatus Actinomarina (◆↓●↓) and a strong decrease in Oleispira (−5.8 log₂, ●↓◆↓).

##Consolidated Biomarker View

The listed robust biomarkers for each treatment:
	•	Tar: Alteromonadaceae (ASV67 Glaceocola ([amyolityca - 100% identities])) ASV enriched on particles, and Marinobacter ([sediminum - 99% identities]) (ASV914) enriched free-living – none of which changed in SW.
	•	Pyrene: no robust multi-method marker; tentative ones are declines of ASV757 Oleibacter marinus on the PA fraction or ASV62 Lentimonas in the FL fraction, which also did not appear in SW (indicating some specificity to pyrene, albeit weak).
	•	Exudate: blooms of Pseudomonadales and Flavovacterales in both fractions, and crash of ASV56 Nitrosopelagicus archea in the FL fraction (which stayed stable in SW and other treatments).
	•	Bottle Effect (SW): Blastopirellula (Planctomycete) and SAR11 Clade Ia increases were unique to SW (and detected by 3 methods), serving as markers of container-induced community shifts rather than any added substance 

In conclusion, by comparing all treatments and fractions, the most robust biomarker candidates for each treatment are those taxa found by multiple methods, in a consistent direction, exclusively in that treatment. Tar contamination is indicated by enriched Alteromonadaceae ( Glaciecola) and Marinobacter (oil-degraders) ￼ ￼. Pyrene exposure showed a distinctive suppression of certain bacteria ( Oleibacter), though these indicators are weaker. Exudate enrichment is clearly marked by blooms of Pseudoalteromonas, Marinomonas, Vibrio – fast-growing heterotrophs that proliferate on added DOM ￼ – and concurrent losses of nitrifiers and oligotrophs ( Candidatus Nitrosopelagicus), consistent with carbon-driven competition effects. The SW control data revealed which of those changes were merely bottle effects ( general increases in SAR11 or Planctomycetes) versus treatment-specific. By focusing on those >2 method consensus, treatment-exclusive ASVs (of which, notably, only the control had 3-method consensus hits, while others mostly maxed at 2), a set of strong biomarkers candidates for each condition. These biomarkers – if validated – could be used to diagnose whether a given sample’s community shift was due to oil (tar), PAH (pyrene) toxicity, or organic enrichment, as opposed to generic incubation changes. 