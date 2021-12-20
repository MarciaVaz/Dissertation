# Dissertation Project by Marcia Vaz
# Dissociating semantic and action processing for animals and tools categories: A representational similarity analysis of behaviour data and fMRI data


To further understand how category knowledge is represented in the brain for different processing types and how we perceive objects similarity, we explore the neural and behavioural representations of semantic and action knowledge concerning animals and tools objects. This experiment was carried out by doing a multi-arrangement task for images similarity judgement and using functional magnetic resonance imaging (fMRI). The two similarity representations were compared using the Representational Dissimilarity Matrix (RDM) method, by [(Kriegeskorte et al 2008a](https://www.frontiersin.org/articles/10.3389/neuro.06.004.2008/full), [2008b)](https://www.cell.com/neuron/fulltext/S0896-6273(08)00943-4?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0896627308009434%3Fshowall%3Dtrue).

## Experiment 1: Behavioural experiment

The multi-arrangement task was done using [Meadows website](https://meadows-research.com/). We recrited 45 participants and we collected their similarity judgements according to action, semantic and visual task. The Meadows output for each participant and task can be found [here](https://github.com/MarciaVaz/Dissertation/tree/main/02_behavioural%20experiment/individual%20RDMs).

Each participant only saw a few images out of 92, meaning that the output of one participant results in a partial RDM (not complete). In order to estimate a final RDM for action, semantic and visual task, we used the [iMDS_MATLAB toolbox](https://github.com/MarciaVaz/Dissertation/blob/main/03_fMRI%20experiment/06_create%20RDMs/iMDS_MATLAB) that scales each participant to each other and normalises the data. I only modified and used ['estimate_from_partials_fMRI.m'](https://github.com/MarciaVaz/Dissertation/blob/main/03_fMRI%20experiment/06_create%20RDMs/iMDS_MATLAB/estimate_from_partials_behav.m) script.

We end up with the final 3 RDMs: action, semantic and action task.


## Experiment 2: fMRI experiment




