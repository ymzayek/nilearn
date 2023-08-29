#!/bin/bash -x

#
if [ ! -z "$PIP_FLAGS" ]; then
    echo "Running $PIP_FLAGS test..."
    python -m pytest --pyargs nilearn --cov=nilearn \
        -W error::DeprecationWarning:matplotlib: \
        -W error::PendingDeprecationWarning:matplotlib: \
        -W error::DeprecationWarning:numpy: \
        -W error::PendingDeprecationWarning:numpy:
else
    python -m pytest --pyargs nilearn --cov=nilearn
fi
