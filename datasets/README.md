# Datasets

This folder contains the CSV files used by the AI4NTH Summer School notebooks.

## What Students Should Do

You normally do not need to open these files directly. The notebooks load the required files from this folder.

If a notebook asks you to choose or inspect a dataset, use the file names below.

| File | Purpose |
|---|---|
| `chf_train.csv` | Organiser-defined training split for the CHF case study |
| `chf_val.csv` | Organiser-defined validation split for the CHF case study |
| `chf_test.csv` | Organiser-defined test split for the CHF case study |
| `chf_GP.csv` | Gaussian-process subset used in surrogate-modelling sessions |
| `chf_ong.csv` | Main CHF dataset export used for exploratory workflows |
| `chf_OOD_Kim2000.csv` | Out-of-domain CHF data source |
| `chf_OOD_Lee1966.csv` | Out-of-domain CHF data source |
| `chf_OOD_Peterlongo1966.csv` | Out-of-domain CHF data source |

## For Lecturers And Dataset Maintainers

This section is for lecturers, organisers, and dataset maintainers.

Dataset provenance, licensing status, target variable, feature notes, and split definitions are documented in `chf_case_study/metadata.yaml`. Keep that metadata up to date before release.
