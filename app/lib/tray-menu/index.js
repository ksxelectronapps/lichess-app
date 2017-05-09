'use strict'
const {resolve} = require('path')
const {readdirSync} = require('fs')
const {Menu} = require('electron')
const tplDirPath = resolve(__dirname, 'template')

const template = readdirSync(tplDirPath)
  .filter(x => /^.*\.js$/.test(x))
  .map(x => require(resolve(tplDirPath, x)))

module.exports = () =>
  Menu.buildFromTemplate(template)
