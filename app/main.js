'use strict'
const {app} = require('electron')
const {openMainWindow} = require('./lib/window-manager.js')
const tray = require('./lib/tray.js')

app.on('ready', openMainWindow)
app.on('ready', tray.addTrayIcon)
app.on('activate', openMainWindow)
app.on('window-all-closed', require('./lib/check-app-quit.js'))
tray.enableTrayIpc()
