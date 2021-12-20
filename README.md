# Dissertation Project by Marcia Vaz
# Dissociating semantic and action processing for animals and tools categories: A representational similarity analysis of behaviour data and fMRI data

To further understand how category knowledge is represented in the brain for different processing types and how we perceive objects similarity, we explore the neural and behavioural representations of semantic and action knowledge concerning animals and tools objects. This experiment was carried out by doing a multi-arrangement task for images similarity judgement and using functional magnetic resonance imaging (fMRI). The two similarity representations were compared using the Representational Dissimilarity Matrix (RDM) method, by [(Kriegeskorte et al 2008a](https://www.frontiersin.org/articles/10.3389/neuro.06.004.2008/full), [2008b)](https://www.cell.com/neuron/fulltext/S0896-6273(08)00943-4?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0896627308009434%3Fshowall%3Dtrue).

## Experiment 1: Behavioural experiment

The multi-arrangement task was done using [Meadows website](https://meadows-research.com/). I recruited 45 participants and collected their similarity judgements according to action, semantic and visual task. The Meadows outputs the perceived euclidean distances between images. The outputs for each participant and task can be found [here](https://github.com/MarciaVaz/Dissertation/tree/main/02_behavioural%20experiment/individual%20RDMs).

Each participant only saw a few images out of 92 total, meaning that the output of one participant results in a partial RDM (not complete). In order to estimate a final RDM for action, semantic and visual tasks, I used the [iMDS_MATLAB toolbox](https://github.com/MarciaVaz/Dissertation/blob/main/03_fMRI%20experiment/06_create%20RDMs/iMDS_MATLAB) that scales each participant to each other and normalises the data. I only modified and used ['estimate_from_partials_behav.m'](https://github.com/MarciaVaz/Dissertation/blob/main/03_fMRI%20experiment/06_create%20RDMs/iMDS_MATLAB/estimate_from_partials_behav.m) script.

We end up with the final 3 RDMs: action, semantic and visual task.


## Experiment 2: fMRI experiment

The fMRI data were analysed and pre-processed using Statistical Parametric Mapping (SPM12; Welcome Department of Imaging Neuroscience, University College London; www.fil.ion.ucl.ac.uk/~spm).

MATLAB was used to extract the onset of each stimulus from the output CSV files of [PsychoPy](https://www.psychopy.org). An onset regressor was created for each stimulus, the regressors were ordered to match the order of the behavioural study. These scripts can be found on ['extract fMRI data (SPM)’](https://github.com/MarciaVaz/Dissertation/tree/main/03_fMRI%20experiment/01_extract%20fMRI%20data%20(SPM)). I posteriorly uploaded these scripts into SPM in order to create the [beta](https://github.com/MarciaVaz/Dissertation/tree/main/03_fMRI%20experiment/02_beta%20images) images for each stimulus for each participant. SPM was used to create the [masks](https://github.com/MarciaVaz/Dissertation/tree/main/03_fMRI%20experiment/04_Masks) and extract the 15 [Regions of Interest](https://github.com/MarciaVaz/Dissertation/tree/main/03_fMRI%20experiment/05_ROIs).

I created a Python script to extract the ROIs from each beta image, using the created binary images (masks), and to create the partial RDMs with euclidean distances, for each ROI and each participant. This was done using [rsatoolbox](https://github.com/MarciaVaz/Dissertation/tree/main/03_fMRI%20experiment/06_create%20RDMs/02_python%20(using%20rsatoolbox)). The final 15 RDMs were estimated using the [iMDS_MATLAB toolbox](https://github.com/MarciaVaz/Dissertation/blob/main/03_fMRI%20experiment/06_create%20RDMs/iMDS_MATLAB), specificly the ['estimate_from_partials_fMRI.m'](https://github.com/MarciaVaz/Dissertation/blob/main/03_fMRI%20experiment/06_create%20RDMs/iMDS_MATLAB/estimate_from_partials_fMRI.m) script.

We end up with the final 30 RDMs (15 ROIs for: action and semantic task).

## Statistics




