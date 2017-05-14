[[ $SKIP_LINT == 'true' ]] && {
  echo "Environment variable SKIP_LINT is true."
  echo "Skipping lint..."
  exit 0
}

wdir="$(pwd)"

(
  echo ":: JavaScript"
  standard || (
    status=$?
    echo "Linting JavaScript files failed."
    exit $status
  )
) && (
  echo ":: HTML"
  (
    js-yaml "$wdir/.htmllintrc.yaml" > "$wdir/.htmllintrc"
  ) && (
    htmllint --cwd="$wdir/app" --rc="$wdir/.htmllintrc"
  ) || (
    status=$?
    echo "Linting HTML files failed."
    exit $status
  )
) && (
  echo ":: Stylesheets"
  (
    stylelint 'app/**/*.css' --config=.stylelintrc.yaml
  ) || (
    status=$?
    echo "Linting stylesheet files failed."
    exit $status
  )
)
