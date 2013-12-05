#= require router
#= require_self

App.Router.reopen
  location: 'history'

App.reopen
  rootElement: '#container'
  LOG_TRANSITIONS: true
