(
  printf "Checking Code Style... "
  standard > stdout.tmp 2> stderr.tmp && (
    echo "passed"
  ) || (
    echo "failed" >&2
    cat stderr.tmp >&2
    cat stdout.tmp
    exit 2
  )
) && (
  export TEST_COUNT_LOGS="$(pwd)/test-count.tmp"
  export TEST_COUNT_LOGS_DELEMITER=$(node "$(pwd)/sh/lib/test-count-log.js")
  echo "Running '/test/index.js'..."
  node "$(pwd)/test" && node "$(pwd)/test/verify.js"
)
