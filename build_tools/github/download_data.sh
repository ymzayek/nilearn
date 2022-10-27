#!/bin/bash -ef

DOWNLOAD_DATA=$(cat <<END
from nilearn import datasets

# Download all datasets used in examples
datasets.fetch_neurovault_motor_task()
datasets.fetch_atlas_smith_2009()['rsn10']
datasets.fetch_atlas_smith_2009()
datasets.fetch_haxby()
datasets.fetch_spm_auditory()
datasets.fetch_surf_fsaverage()
datasets.fetch_atlas_surf_destrieux()
datasets.fetch_atlas_destrieux_2009(legacy_format=False)
datasets.fetch_atlas_harvard_oxford('cort-maxprob-thr25-2mm')
datasets.fetch_atlas_juelich('maxprob-thr0-1mm')
datasets.fetch_adhd(n_subjects=1)
datasets.fetch_icbm152_2009()
datasets.fetch_localizer_button_task(legacy_format=False)
datasets.fetch_atlas_basc_multiscale_2015(version='sym')
datasets.fetch_atlas_msdl()
datasets.fetch_atlas_harvard_oxford('cort-prob-2mm')
datasets.fetch_atlas_harvard_oxford('sub-prob-2mm')
datasets.fetch_atlas_allen_2011()
datasets.fetch_atlas_pauli_2017()
datasets.fetch_atlas_difumo(dimension=64, resolution_mm=2, legacy_format=False)
datasets.fetch_surf_nki_enhanced(n_subjects=1)
datasets.fetch_megatrawls_netmats(
    dimensionality=300,
    timeseries='eigen_regression',
    matrices='partial_correlation'
)
datasets.fetch_mixed_gambles(n_subjects=16)
datasets.fetch_miyawaki2008()
datasets.fetch_oasis_vbm(n_subjects=100, legacy_format=False)
datasets.fetch_atlas_yeo_2011()
datasets.fetch_development_fmri(n_subjects=10)
datasets.fetch_coords_power_2011(legacy_format=False)
datasets.fetch_coords_dosenbach_2010(legacy_format=False)
datasets.fetch_fiac_first_level()
datasets.fetch_localizer_first_level()
datasets.fetch_icbm152_brain_gm_mask()
datasets.fetch_spm_multimodal_fmri()
datasets.fetch_localizer_contrasts(
    ["left vs right button press"], 16,
    get_tmaps=True, legacy_format=False
)
datasets.fetch_localizer_calculation_task(
    n_subjects=20, legacy_format=False
)
datasets.fetch_neurovault_auditory_computation_task()
datasets.fetch_language_localizer_demo_dataset()

# Minimal download of openneuro dataset
_, urls = datasets.fetch_ds000030_urls()
exclusion_patterns = ['*group*', '*phenotype*', '*mriqc*',
                      '*parameter_plots*', '*physio_plots*',
                      '*space-fsaverage*', '*space-T1w*',
                      '*dwi*', '*beh*', '*task-bart*',
                      '*task-rest*', '*task-scap*', '*task-task*']
urls = datasets.select_from_index(
    urls, exclusion_filters=exclusion_patterns, n_subjects=1)
datasets.fetch_openneuro_dataset(urls=urls)
datasets.fetch_neurovault(max_images=30, fetch_neurosynth_words=True)
datasets.fetch_neurovault_ids(
    image_ids=(151, 3041, 3042, 2676, 2675, 2818, 2834)
)

END
)

python3 -c "$DOWNLOAD_DATA"