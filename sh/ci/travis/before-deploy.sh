(
  echo '-- Installing addons...'
  bash addons/main.sh
) && (
  echo '-- Creating packages...'
  export OPTIONS="publish=never $TARGET_OS $TARGET_ARCH $OPTIONS"
  npm run pack
) && (
  echo '-- Listing artifacts...'
  ls dist/{,linux,mac,win}
  true
) || (
  status=$?
  echo "Executation of command '$*' failed." >&2
  exit $status
)
