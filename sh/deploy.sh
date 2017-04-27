#! /usr/bin/env bash
export GH_TOKEN=$GITHUB_RELEASE_OAUTH
export OPTIONS="publish=onTagOrDraft linux mac $OPTIONS"

if [[ -z $GH_TOKEN ]]
  then
    echo "No Release token provided." >&2
    echo "Deployment failed." >&2
    exit 1
fi

npm run pack && (
  echo "Deployment succeed."
) || (
  status=$?
  echo "Failed on 'npm run pack'" >&2
  echo "Deployment failed." >&2
  exit $status
)
