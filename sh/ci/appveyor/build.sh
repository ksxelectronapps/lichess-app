export OPTIONS="$TARGET_OS $TARGET_ARCH $OPTIONS"
export SKIP_NPM_TEST='true'
exec npm run pack
