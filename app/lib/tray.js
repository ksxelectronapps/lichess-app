'use strict'
const {Tray, ipcMain} = require('electron')
const {icon} = require('./platform-specific.js')
const buildTrayMenu = require('./tray-menu')
const checkAppQuit = require('./check-app-quit.js')
let tray = null

const addTrayIcon = () => {
  tray = new Tray(icon)
  tray.setToolTip('Lichess')
  tray.setContextMenu(buildTrayMenu())
}

const removeTrayIcon = () => {
  tray.destroy()
  tray = null
  checkAppQuit()
}

const toggleTrayIcon = () =>
  tray ? removeTrayIcon() : addTrayIcon()

const ipcFunc = [
  ['add-tray-icon', addTrayIcon],
  ['remove-tray-icon', removeTrayIcon],
  ['toggle-tray-icon', toggleTrayIcon]
]

const enableTrayIpc = () =>
  ipcFunc.map(x => ipcMain.addListener(...x))

const disableTrayIpc = () =>
  ipcFunc.map(x => ipcMain.removeListener(...x))

const getTray = () => tray

module.exports = {
  addTrayIcon,
  removeTrayIcon,
  toggleTrayIcon,
  ipcFunc,
  enableTrayIpc,
  disableTrayIpc,
  getTray
}
