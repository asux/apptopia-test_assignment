App.IndexController = App.ApplicationController.extend
  total: (->
    currentCarrier = App.carriers.filter((item)->
      item.name == App.currentCarrierName
    )[0]
    parcelWeight = App.parcel.get('weight')
    if isNaN(parcelWeight) or parcelWeight is '' or parcelWeight is null
      "Enter parcel weight as a number."
    else if not currentCarrier
      "Select the carrier."
    else if currentCarrier.get('isOverloaded')
      "This parcel is over processing limits for #{currentCarrier.get('name')}."
    else
      total = parseFloat(App.processingFee) +
      parseFloat(currentCarrier.get('processingFee')) +
      parseFloat(parcelWeight) *
      parseFloat(currentCarrier.get('pricePerUnit'))
      "$#{total}"
  ).property('App.parcel.weight', 'App.currentCarrierName')
