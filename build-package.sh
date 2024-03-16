#!/bin/bash

# clean up cached files
rm -rf dist build
find . \
  -type d \
  \( \
  -name "*cache*" \
  -o -name "*.dist-info" \
  -o -name "*.egg-info" \
  \) \
  -not -path "./venv/*" \
  -exec rm -r {} +

rebuild and uznzip the wheel
python -m build --sdist --wheel ./
pip install '.[all]'

# Use those if you want to see a preview of package in dist.
# cd dist
# unzip *.whl
# cd ..
