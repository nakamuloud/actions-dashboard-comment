#!/bin/sh
env
cd /app

if [ -z "$INPUT_REPOSITORY" ]; then
  INPUT_OWNER=${GITHUB_REPOSITORY_OWNER}
fi

if [ -z "$INPUT_OWNER" ]; then
  INPUT_REPOSITORY=${GITHUB_REPOSITORY#*/}
fi

if [ -z "$INPUT_ISSUE_NUMBER" ]; then
  INPUT_ISSUE_NUMBER=${GITHUB_REF%/*}
fi

echo env | grep INPUT

go run src/main.go -owner ${INPUT_OWNER} -repository ${INPUT_REPOSITORY} -commentId rewritable-comment -issueNumber ${INPUT_ISSUE_NUMBER} -key ${INPUT_KEY:-default} -value ${INPUT_VALUE}
