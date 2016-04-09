#!/bin/bash

# A custom travis-wait that directly prints the output.
# Originally presented here: https://github.com/travis-ci/travis-ci/issues/4190#issuecomment-169987525

$@ & # send the long living command to background!

minutes=0
limit=50
while kill -0 $! >/dev/null 2>&1; do
  echo -n -e " \b" # never leave evidences!

  if [ $minutes == $limit ]; then
    break;
  fi

  minutes=$((minutes+1))

  sleep 60
done
