#!/usr/bin/env bash

for repo in $(gh repo list -L 150 --json name | jq -r '.[].name'); do
  keep=0
  for keep_repo in $(jq -r '.[].name' ~/.repos.json); do
    if [[ $keep_repo = "$repo" ]]; then
      keep=1
      break
    fi
  done
  if [[ 1 = "$keep" ]]; then
    echo "Keeping $repo"
  else
    echo "Deleting $repo"
    gh repo delete --confirm "$repo"
  fi
done
