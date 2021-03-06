'use strict'
const {BrowserWindow} = require('electron')
const {icon} = require('./platform-specific.js')
let mainWindow = null

const getMainWindow = () => mainWindow

const openMainWindow = () => {
  if (mainWindow) return
  mainWindow = new BrowserWindow({icon})
  mainWindow.loadURL('https://lichess.org')
  mainWindow.on('closed', () => { mainWindow = null })
}

const closeMainWindow = () =>
  mainWindow && mainWindow.close()

const toggleMainWindow = () =>
  mainWindow ? closeMainWindow() : openMainWindow()

const getWindowCount = () =>
  BrowserWindow.getAllWindows().length

module.exports = {
  getMainWindow,
  openMainWindow,
  closeMainWindow,
  toggleMainWindow,
  getWindowCount
}
