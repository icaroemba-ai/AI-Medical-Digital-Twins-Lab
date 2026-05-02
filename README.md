[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19926992.svg)](https://doi.org/10.5281/zenodo.19926992)

# AI Medical Digital Twins: Adaptive Filtering for Chiari Pathophysiology

**A complete 2-hour senior Biomedical Engineering Control Systems laboratory**

Students build a **patient-specific medical digital twin** from real anonymized cine-MRI, model the olivo-cerebellar circuit in Simulink (with realistic 50 ms neural delay), discover why biological feedback fails at 1 Hz cardiac pulsations, and then design an **LMS adaptive neural implant** that successfully cancels the disturbance.

New in this version: **Part 6** — realistic SWaP-C trade-off analysis (optimizing LMS filter length under microcontroller memory constraints).

### What Students Do
- Extract disturbance using MATLAB computer vision (`normxcorr2`)
- Build and simulate the physiological closed-loop model in Simulink
- Perform gain-margin analysis to find the biological learning-rate limit
- Implement an LMS adaptive feedforward controller (AI neural implant)
- Optimize filter length under realistic hardware constraints (SWaP-C)

### Student Feedback
> "It was awesome being in the first cohort to trial this lab. Such a cool application for control systems!"  
> — BME-4110 Student (First Cohort)

### Files Included
- `Lab 10 - Digital TwinV3.pdf` — Full lab handout
- MATLAB scripts (MRI feature extraction + stochastic disturbance generation)
- Simulink models (`Chiari.slx`, `DigitalTwin_AI.slx`)
- Rubric and team assessment form

**Note on MRI Video:**  
The original anonymized MRI video used in the lab is **not provided** in this repository (due to privacy and data-use considerations).  
If you do not have access to any cine-MRI data, you can use a **simple sine wave disturbance** with amplitude between **0–5** for the dynamic disturbance simulation. The lab works well with this substitution.

### How to Use
1. Download the PDF and all files
2. Follow the lab handout (designed for one 2-hour session)
3. Everything runs in MATLAB + Simulink

**License:** CC BY 4.0 — Feel free to use, adapt, and share with attribution.


## Citation

If you use this material for teaching or research, please cite the Zenodo record:

dos Santos, I. (2026). *AI Medical Digital Twins: Adaptive Filtering for Chiari Pathophysiology Simulation and Analytical Modeling*. Zenodo. 

**Zenodo DOI (citable version):** [https://doi.org/10.5281/zenodo.19926992](https://doi.org/10.5281/zenodo.19926992)

---

Questions, feedback, or want to collaborate? Just open an Issue or reach out!

Made for BME-4110 Control Systems at Milwaukee School of Engineering.
