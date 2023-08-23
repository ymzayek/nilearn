#!/bin/bash -x

if [[ $PIP_FLAGS ]]; then
    python -m pytest --pyargs nilearn --cov=nilearn -W error::DeprecationWarning,error::PendingDeprecationWarning
else
    python -m pytest --pyargs nilearn --cov=nilearn
fi
