#!/bin/bash

log_name=/tmp/brewlog/`date "+%Y%m%d_%H%M%S"`.log

echo 'brew doctor ----------------------------' >> ${log_name} 2>&1
brew doctor >> ${log_name} 2>&1
if [[ $? -ne 0 ]]; then
  brew update >> ${log_name} 2>&1
  echo 'brew update ----------------------------' >> ${log_name} 2>&1
  brew upgrade >> ${log_name} 2>&1
  echo 'brew upgrade ----------------------------' >> ${log_name} 2>&1
  brew cleanup --prune=all >> ${log_name} 2>&1
  echo 'brew cleanup ----------------------------' >> ${log_name} 2>&1
  tldr --update >> ${log_name} 2>&1
  echo 'tldr --update ----------------------------' >> ${log_name} 2>&1
fi
