'use strict'
const {resolve} = require('path')

module.exports = ({
  linux: {
    icon: resolve(__dirname, '../icon/linux/512x512.png')
  },
  macos: {
    icon: resolve(__dirname, '../icon/macos.icns')
  },
  windows: {
    icon: resolve(__dirname, '../icon/windows.ico')
  }
})[require('process').platform]
