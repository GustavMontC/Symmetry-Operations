[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.17480028.svg)](https://doi.org/10.5281/zenodo.17480028)

# Data and Code for Physical Review E Article

## 📄 Associated Publication
This repository contains the data and code to reproduce all figures and results for the article:

**"Symmetry operations and Critical Behaviour in Classical to Quantum Stochastic Processes"**
* **Journal:** Physical Review E (PRE)
* **Preprint:** https://arxiv.org/pdf/2409.09277
* **Published Version (Please Cite):** [Insert Final DOI Link Here]

---

## 💾 Repository Contents and Mapping

This repository contains two main elements:

* **Raw Data:** Files in the `/data` directory (*.txt).
* **Gnuplot Scripts:** Files in the `/code` directory (*.gnu) used to generate the figures.

| Paper Figure | Gnuplot Script (*.gnu) | Generated File (*.tex) |
| :--- | :--- | :--- |
| **Figure 1** | `Observables-12S.gnu` | `Observables-12S.tex` |
| **Figure 2** | `Shrtime_0_Cohe_SYH_HAD.gnu` | `Shrtime_0_Cohe_SYH_HAD.tex` |
| **Figure 3** | `MIS00_0_Cohe_HAD.gnu` | `MIS00_0_Cohe_HAD.tex` |

---

## 💻 Instructions for Reproduction

To reproduce the figures, you must have **Gnuplot** and a **LaTeX distribution** (like Tex Live) installed.

1.  **Navigate to the Code Directory:** Clone this repository and open your terminal in the `/code` directory.

2.  **Generate .tex Files (Gnuplot):** Run the following Gnuplot scripts to generate the `.tex` files containing the figure code:
    ```bash
    gnuplot Observables-12S.gnu
    gnuplot MIS00_0_Cohe_HAD.gnu
    gnuplot Shrtime_0_Cohe_SYH_HAD.gnu
    ```

3.  **Compile Figures (LaTeX):** Compile the generated `.tex` files into PDF figures:
    ```bash
    for i in *.tex; do pdflatex "$i"; done
    ```

4.  **Cleanup (Optional):** Remove auxiliary files:
    ```bash
    rm *.tex *-to.pdf *.eps *.aux *.log
    ```

**Tested Environment:**
* `Ubuntu 24.04`
* `GNUPLOT 6.0 patchlevel 0`
* `Tex Live version 2023`

---

## ⚖️ Licensing
**Dataset DOI:** [10.5281/zenodo.17480028](https://doi.org/10.5281/zenodo.17480028)

The data and code are licensed separately for clarity and maximum reusability.

### Data License (CC0)
The data files in this repository (all files in the `/data` directory) are dedicated to the public domain under the **Creative Commons Zero (CC0 1.0) Public Domain Dedication**. The user is expected to cite the associated journal article as a matter of scientific best practice.

### Code License (MIT)
All source code and scripts in this repository (all files in the `/code` directory) are released under the **MIT License**.
