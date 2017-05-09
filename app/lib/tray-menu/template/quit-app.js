'use strict'
module.exports = {
  label: 'Quit',
  click: () =>
    require('electron').app.quit()
}
