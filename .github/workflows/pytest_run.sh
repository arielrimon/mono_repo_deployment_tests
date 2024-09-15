#!/bin/sh

# For every file in repo
for i in $(ls); do
  # Check if it's a folder
  if [[ -d "$i" ]]; then
    cd $i
      is_py=0
      for f in $(ls); do
        # Check if it contains python files
        if [[ $f == *.py ]]; then
          is_py=$((is_py+1))
        fi
      done
      # Run tests if it does
      if ((is_py == 0)); then
        cd .. 
        continue
      else
        pip install -r requirements.txt
        pytest
        cd ..
      fi
  fi
done
