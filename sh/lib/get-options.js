'use strict'
const {OPTIONS} = require('process').env
console.log(
  (OPTIONS || '')
    .split(/[,; ]/)
    .filter(Boolean)
    .map(
      string =>
        (string.length === 1 ? '-' : '--') + string
    )
    .join(' ')
)
