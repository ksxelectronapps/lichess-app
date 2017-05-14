(
  echo '-- Installing addons...'
  bash addons/main.sh
) && (
  echo '-- Creating packages...'
  export OPTIONS="publish=never $TARGET_OS $TARGET_ARCH $OPTIONS"
  export SKIP_NPM_TEST='true'
  yarn run pack
) && (
  echo '-- Listing artifacts...'
  ls dist/{,linux,mac,win}
  true
) || (
  status=$?
  echo "Execution of command '$0 $@' failed." >&2
  exit $status
)
