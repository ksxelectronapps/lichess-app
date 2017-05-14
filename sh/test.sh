[[ -z $ALTER_NPM ]] || {
  npm=$ALTER_NPM
  export ALTER_NPM=''
  exec $npm test
}

[[ $SKIP_NPM_TEST == 'true' ]] && (
  echo "Environment variable SKIP_NPM_TEST is true."
  echo "Skipping test..."
) || (
  printf "Checking Code Style... "
  bash ./sh/lint.sh > stdout.tmp 2> stderr.tmp && (
    echo "passed"
  ) || (
    echo "failed" >&2
    cat stderr.tmp >&2
    cat stdout.tmp
    exit 2
  )
)
