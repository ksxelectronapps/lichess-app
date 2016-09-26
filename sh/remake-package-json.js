'use strict'
const file = require('path').join(__dirname, '../package.json')
const {readFileSync, writeFileSync} = require('fs')
const {stdout} = require('process')
const {indent, crlf} = require('./lib/package-json-config.json')
const {parse, stringify} = JSON
const ENCODING = {encoding: 'utf8'}
const jsonobj = parse(readFileSync(file, ENCODING))
const jsonstr = stringify(jsonobj, undefined, indent).split('\n').join(crlf ? '\r\n' : '\n')
writeFileSync(file, jsonstr, ENCODING)
stdout.write('Done.\n')
