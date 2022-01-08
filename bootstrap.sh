#!/usr/bin/env bash

rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude "bootstrap.sh" \
  --exclude ".vim/UltiSnips"\
  --exclude "README.md" \
  --exclude "LICENSE-MIT.txt" \
  -avrthopg \
  --no-perms . ~;

echo "Done."

