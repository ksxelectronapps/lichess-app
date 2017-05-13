npm test && (
  export GH_TOKEN=$(
    [ -n $GH_TOKEN ] && (
      echo $GH_TOKEN
    ) || (
      echo $GITHUB_RELEASE_OAUTH
    )
  )
  build $(node ./sh/lib/get-options.js)
)
