[[ $APPVEYOR_REPO_TAG != 'true' && -z $TRAVIS_TAG ]] && exit 0

(
  echo '-- Installing addons...'
  bash addons/main.sh
) && (
  echo '-- Creating packages...'
  OPTIONS="publish=never $TARGET_OS $TARGET_ARCH $OPTIONS" npm run pack
) && (
  echo '-- Listing artifacts...'
  ls dist/{,linux,mac,win}
  true
) || (
  status=$?
  echo "Executation of command '$*' failed." >&2
  exit $status
)
