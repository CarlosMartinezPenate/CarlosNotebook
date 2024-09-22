
#Experimental Design: Testing the Diffusion Properties of 142 mm Filters in Diffusion Chambers
**Objective:**
To test and characterize the diffusion properties of 142 mm filters with varying pore sizes in a controlled environment using diffusion chambers. By varying the syringe pump breathing rates, the experiment will assess how different filters allow the passage of phenol red and measure diffusion rates over time. The goal is to understand how pore size, filter material, and breathing rate influence diffusion under simulated coastal marine conditions.

**Location:** IOLR

##**Materials:**

- Diffusion Chamber (DC): 1.6 L diffusion chamber, Part of McLane's DCS custom system consisting, polycarbonate body, tubular with 142 mm filters positioned between two meshes at both ends.

- *Syringe Pump Breathing System:*
	- Kynar Breathing Bag: Connected to the syringe pump, forming part of a closed system with distilled water.
	- Syringe Pump: Capable of controlling the volume of water flow (50 mL syringe) at different breathing rates.
- *Semi-Automated Sampling System*:	
	- ISCO Foxy Jr. Fraction Collector (FJFC)
	- Peristaltic pumps ( NKCP_S08B and NKCP_204B)
	- Digital timer (for synchronization with FJFC)
- 200 L Submersion Tank: Filled with running saltwater to simulate marine conditions, with constant flow at 1-2 L/min.
- 142 mm Filters: with 0.22 µm, 0.45 µm, 0.8 µm pore sizes, different materials for testing
- Conductivity meter 
- Volumetric flasks, graduated cylinders, pipettes and tubes
- Multiplate reader
- pH meter

##**Reagents:**

- Phenol red solution (as a diffusion tracer)
- Distilled water (for the breathing system)
- Ethanol (for cleaning)

##Methods:

**Preparation:**

*Chamber Setup:*

- Assemble the diffusion chamber with 142 mm filters securely placed between the two end pieces and meshes.
- Attach hoses to chamber ports: one set for distilled water flow through the Kynar breathing bag, another for phenol red injection, and a sampling port. 

*Syringe Pump Breathing System Setup:*

- Connect the Kynar breathing bag to the syringe pump using appropriate tubing, forming a closed loop of distilled water between the bag, syringe, and hose.
- Set the syringe pump to varying breathing rates to simulate different volumes of water being pushed into and pulled out of the chamber.


*Semi-Automatic Sampling Setup:*

- Attach the low-volume peristaltic pump to the chamber sampling port.
- Program the electronic timer relay to control the pumps, setting the time intervals for collecting samples.
- Program the Fraction Collector to match the timing of the relay.
- Attach a hose to the second peristaltic pump and submerge in the tank to sample at a specific depth. 


##Procedure 

*Submersion and System Set up:*

- Use a clean tank
- Set seawater flow to (1-2 L/min), and fill until overflowing. 
- Fill the Diffusion Chamber with seawater from the tank using one of the sampling peristaltic pumps before submersion. 
- Submerge the setup diffusion chamber in the tank filled with running saltwater and monitor temperature, salinity, and pH to ensure stable conditions.

*Control the Syringe Pump:*

- Set the syringe pump to varying breathing rates o simulate different volumes of water being pushed into and pulled out of the chamber.

*Control of the Semi-Automatic Sampling:*

- Synchronize the ISCO Foxy Jr. Fraction Collector (FJFC) with the digital timer to automatically collect samples at regular intervals.

*Introducing Phenol Red:*

- Inject a precise amount of phenol red into the chamber’s distilled water side through the designated hose.

*Synchronized Sampling:*

- Collect chamber samples via the fraction collector at programmed intervals using the low-volume pump.
 - simultaneously, use the second pump to collect tank samples manually.
- Continue sampling until phenol red concentrations stabilize or reach equilibrium between the chamber and tank (indicating diffusion through the filters).

*Monitoring Phenol Red Concentration:*

- Analyze the phenol red concentration in both sets of samples using a spectrophotometer or colorimeter at its optimal wavelength (~558 nm for phenol red).

#Experimental Setup

| **Parameter**                | **Test Condition**                              | **Control Condition**                      | **Replicates** | **Notes**                                                                                 |
|------------------------------|-------------------------------------------------|--------------------------------------------|----------------|-------------------------------------------------------------------------------------------|              
| **Filter Pore Size**          | 0.22 µm, 0.45 µm, 0.8 µm filters                | No filter (positive control)               | 3 per pore size| Testing different pore sizes for filtration efficiency and diffusion rate.                |
| **Breathing Rate** | Different breathing rates (e.g., 10 mL/min, 20 mL/min, 50 mL/min) | No pump action                             | 3 per rate     | Simulating different flow volumes with the syringe pump to observe diffusion rate changes. |
| **Filter Material**           | Cellulose acetate, PTFE                         | Standard filter (cellulose acetate)        | 3 per material | Investigating different filter materials for solute passage and resistance.               |



##Controls in the Experiment
| **Parameter**                 | **Test Condition**                              | **Control**                                   | **Control Type**       |
|-------------------------------|-------------------------------------------------|-----------------------------------------------|------------------------| |
| **Phenol Red Concentration**   | Inject phenol red into chamber                  | Chamber with no phenol red injection          | Negative Control        |
| **Breathing Rate** | Vary syringe pump flow rate                  | No pump action       | Negative Control        |
| **Filter Pore Size**           | Use different filter pore sizes | Chamber with no filter                        | Positive Control        | |

##**Data Analysis:**

**Concentration Measurement:**
- Measure the absorbance of phenol red in the samples using a multi-plate reader (wavelength: 558 nm).
- Plot concentration vs. time to analyze how the phenol red diffuses through the different filter filters under different breathing rates.

**Diffusion Rate Calculation:**
- Use Fick’s law of diffusion to calculate the diffusion coefficient for each condition:

$
J = -D \frac{dC}{dx}
$

where:

- $J$ is the flux (amount of solute diffused per unit area per unit time),
- $D$ is the diffusion coefficient,
- $ \frac{dC}{dx} $ is the concentration gradient across the filter.

**Effect of Breathing Rates:**
- Compare the diffusion rates for each breathing rate and assess how the rate of filling/emptying the Kynar bag affects the exchange of material through the filters.

**Statistical Analysis:**
- Perform regression analysis to assess the relationship between breathing rate and diffusion.
- Use ANOVA or t-tests to compare different rates and control conditions.





