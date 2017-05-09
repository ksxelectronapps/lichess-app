'use strict'
module.exports = {
  label: 'Remove from tray',
  click: () =>
    require('../../tray.js').removeTrayIcon()
}
