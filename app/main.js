'use strict'
const {app, BrowserWindow} = require('electron')
const url = require('url')
const path = require('path')
const {platform} = require('process')
let mainWindow

function createWindow () {
  mainWindow = new BrowserWindow()
  mainWindow.loadURL(
    url.format({
      pathname: path.join(__dirname, 'page', 'index.html'),
      protocol: 'file:',
      slashes: true
    })
  )
  mainWindow.on('closed', () => { mainWindow = null })
}

app.on('ready', createWindow)
app.on('window-all-closed', () => platform === 'darwin' || app.quit())
app.on('activate', () => mainWindow || createWindow())
