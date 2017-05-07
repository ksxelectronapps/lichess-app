'use strict'
const {app, BrowserWindow} = require('electron')
const {platform} = require('process')
let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow()
  mainWindow.loadURL('https://lichess.org')
  mainWindow.on('closed', () => { mainWindow = null })
}

app.on('ready', createWindow)
app.on('window-all-closed', () => platform === 'darwin' || app.quit())
app.on('activate', () => mainWindow || createWindow())
