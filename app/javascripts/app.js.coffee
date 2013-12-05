#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./routes
#= require_tree ./views
#= require router
#= require_self

App.Router.reopen
  location: 'history'

App.reopen
  rootElement: '#container'
  LOG_TRANSITIONS: true
  parcel: App.Parcel.create()
