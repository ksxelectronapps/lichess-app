[[ $APPVEYOR_REPO_TAG == 'true' ]] || {
  echo 'Not in a tag.'
  echo 'Skipping build...'
  exit 0
}

export OPTIONS="$TARGET_OS $TARGET_ARCH $OPTIONS"
export SKIP_NPM_TEST='true'
exec yarn run pack
