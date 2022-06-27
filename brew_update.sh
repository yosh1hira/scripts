#!/bin/bash

log_name=/tmp/brewlog/`date "+%Y%m%d_%H%M%S"`.log

if [[ $? -ne 0 ]]; then
  /usr/local/bin/brew update >> ${log_name} 2>&1
  echo 'brew update ----------------------------' >> ${log_name} 2>&1
  /usr/local/bin/brew upgrade >> ${log_name} 2>&1
  echo 'brew upgrade ----------------------------' >> ${log_name} 2>&1
  /usr/local/bin/brew cleanup --prune=all >> ${log_name} 2>&1
  echo 'brew cleanup ----------------------------' >> ${log_name} 2>&1
  /usr/local/bin/tldr --update >> ${log_name} 2>&1
  echo 'tldr --update ----------------------------' >> ${log_name} 2>&1
fi
