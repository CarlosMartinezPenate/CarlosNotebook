---
layout: post
title: Livak Method
date: '2024-07-11'
categories: Protocols
tags: qPCR
---
#The Livak Method

The Delta Delta Cycle Threshold (ΔΔCt) method, also known as the Livak method, is a common way to analyze relative gene expression data from real-time quantitative PCR (qPCR). Here's a breakdown of the calculations involved:

### Step 1: ΔCt Calculation

**Ct (Cycle Threshold):** This is the cycle number at which the fluorescence signal reaches a predefined threshold, indicating significant amplification of the target DNA. You first calculate ΔCt for both your target gene and reference gene (housekeeping gene) in each sample.

$$ \Delta Ct = Ct_{\text{target gene}} - Ct_{\text{reference gene}} $$

### Step 2: ΔΔCt Calculation

Next, you compare the ΔCt values between your test group and a control group (calibrator).

$$ \Delta\Delta Ct = \Delta Ct_{\text{test sample}} - \Delta Ct_{\text{control sample}}$$
### Step 3: Fold Change Calculation

The final step involves calculating the fold change in gene expression relative to the control group. This is achieved using the formula:

$$\text{Fold Change} = 2^{-\Delta\Delta Ct}$$
