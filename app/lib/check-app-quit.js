'use strict'
const {app} = require('electron')
const {getWindowCount} = require('./window-manager.js')

module.exports = () =>
  require('./tray.js').getTray() || getWindowCount() || app.quit()
