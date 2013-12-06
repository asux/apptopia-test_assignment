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
  parcel: App.Parcel.create()
  processingFee: 15
  currentCarrierName: null
  carriers: [
    App.Carrier.create
      name: 'EMS'
      processingFee: 10
      pricePerUnit: 1.5
      maxWeight: 30
    App.Carrier.create
      name: 'Priority'
      processingFee: 15
      pricePerUnit: 5
      maxWeight: 22
    App.Carrier.create
      name: 'Courier'
      processingFee: 20
      pricePerUnit: 15
      maxWeight: 10
  ]
