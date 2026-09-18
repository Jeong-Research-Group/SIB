# MP-Na Screening Dataset

This directory contains candidate structures and computational data generated during the screening process for sodium-ion battery (SIB) cathode materials.

The subdirectories correspond to different stages of the screening workflow.

## Directory Description

### generation

Initial candidate structures generated for sodium-ion battery cathode material screening.

### mattersim

Structures evaluated using MatterSim for machine-learning-based structural and thermodynamic stability assessment.

### ehull

Structures selected after thermodynamic stability screening based on the energy above the convex hull.

Screening criterion:
- Energy above convex hull (E_hull) ≤ ____ eV/atom

### alignn

Structures satisfying the ALIGNN-predicted electronic-property criterion.

Screening criterion:
- Band gap > ____ eV

### oxidation_state

Structures remaining after oxidation-state screening to identify chemically reasonable compositions and oxidation states.

### average_voltage

Structures remaining after screening based on the calculated average Na insertion/extraction voltage.

Screening criterion:
- Average voltage: ____ V

### reversibility

Structures remaining after evaluation of criteria associated with reversible Na-ion insertion and extraction.

Screening criterion:
- Reversibility criterion: ____

### modulus

Structures remaining after mechanical-property screening.

Screening criterion:
- Elastic modulus: ____

### spglib

Structures analyzed using spglib for crystal symmetry and space-group identification.

## Number of Structures

```text id="gfn79x"
generation        : ____ structures
mattersim         : ____ structures
ehull             : ____ structures
alignn            : ____ structures
oxidation_state   : ____ structures
average_voltage   : ____ structures
reversibility     : ____ structures
modulus           : ____ structures
spglib            : ____ structures
```

## File Format

Candidate structures and associated screening results are organized within the corresponding screening-stage directories.

Crystal structures are provided primarily in VASP POSCAR and CIF (`.cif`) formats where applicable.

Additional data files contain the calculated or predicted properties used at each screening stage.

## Computational Tools

The screening workflow employs the following computational tools and methods:

* **MatterGen**  
  Used for generative exploration of candidate sodium-ion battery cathode materials.

* **MatterSim**  
  Used for machine-learning-based structural and thermodynamic stability evaluation.

* **ALIGNN (Atomistic Line Graph Neural Network)**  
  Used for machine-learning-based prediction of electronic properties.

* **Energy Above Hull (E_hull)**  
  Used to evaluate the thermodynamic stability of candidate structures.

* **Oxidation-State Analysis**  
  Used to evaluate chemically reasonable oxidation states and compositions.

* **Average Voltage Calculation**  
  Used to evaluate the electrochemical voltage characteristics associated with Na-ion insertion and extraction.

* **Reversibility Analysis**  
  Used to assess criteria relevant to reversible Na-ion insertion and extraction.

* **Elastic Modulus Analysis**  
  Used to evaluate the mechanical properties of the screened candidate structures.

* **spglib**  
  Used for crystal symmetry analysis, space-group identification, and structural standardization.

* **VASP (Vienna Ab initio Simulation Package)**  
  Used for density functional theory (DFT) calculations and validation of the screened candidate structures.

## Notes

The structures and computational data in this directory represent intermediate stages of the SIB cathode screening workflow.

The screening procedure progressively evaluates generated candidate materials based on thermodynamic stability, electronic properties, chemical validity, oxidation states, electrochemical properties, reversibility, and mechanical properties.

Final candidate structures obtained after the complete screening and DFT validation are provided separately in the `../structures/final_candidate/` directory.

## References

### [1] MatterGen

C. Zeni et al.,  
"A generative model for inorganic materials design,"  
*Nature* (2025).  
DOI: 10.1038/s41586-025-08628-5

### [2] MatterSim

H. Yang et al.,  
"MatterSim: A Deep Learning Atomistic Model Across Elements, Temperatures and Pressures,"  
*arXiv:2405.04967* (2024).  
DOI: 10.48550/arXiv.2405.04967

### [3] ALIGNN

K. Choudhary and B. DeCost,  
"Atomistic Line Graph Neural Network for improved materials property predictions,"  
*npj Computational Materials*, **7**, 185 (2021).  
DOI: 10.1038/s41524-021-00650-1

### [4] VASP

G. Kresse and J. Furthmüller,  
"Efficient iterative schemes for ab initio total-energy calculations using a plane-wave basis set,"  
*Physical Review B*, **54**, 11169–11186 (1996).  
DOI: 10.1103/PhysRevB.54.11169

### [5] VASP

G. Kresse and J. Furthmüller,  
"Efficiency of ab-initio total energy calculations for metals and semiconductors using a plane-wave basis set,"  
*Computational Materials Science*, **6**, 15–50 (1996).  
DOI: 10.1016/0927-0256(96)00008-0

### [6] PAW Method / VASP

G. Kresse and D. Joubert,  
"From ultrasoft pseudopotentials to the projector augmented-wave method,"  
*Physical Review B*, **59**, 1758–1775 (1999).  
DOI: 10.1103/PhysRevB.59.1758
