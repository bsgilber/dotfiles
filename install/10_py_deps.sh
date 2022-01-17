#!/bin/sh

set -e

# Load dev dependencies to python virtualenv
py_dev="
    pylint
    flake8
    bandit
    black
    isort
    pytest
"

if [ "$PIPENV_ACTIVE" ]; then
    for dep in ${py_dev}; do
        pipenv install "$dep" --dev --skip-lock
    done
elif [ "$POETRY_ACTIVE" ]; then
    for dep in ${py_dev}; do
        poetry add "$dep" --dev
    done
elif [ "$VIRTUAL_ENV" ]; then
    for dep in ${py_dev}; do
        pip install "$dep"
    done
    pip freeze >>requirements_dev.txt
else
    echo "please activate a virtualenv and rerun"
fi

