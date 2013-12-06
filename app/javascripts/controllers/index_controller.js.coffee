App.IndexController = App.ApplicationController.extend
  isValid: false
  total: (->
    currentCarrier = App.carriers.filter((item)->
      item.name == App.currentCarrierName
    )[0]
    parcelWeight = App.parcel.get('weight')
    if isNaN(parcelWeight) or parcelWeight is '' or parcelWeight is null
      @set 'isValid', false
      "Enter parcel weight as a number."
    else if not currentCarrier
      @set 'isValid', false
      "Select the carrier."
    else if currentCarrier.get('isOverloaded')
      @set 'isValid', false
      "This parcel is over processing limits for #{currentCarrier.get('name')}."
    else
      total = parseFloat(App.processingFee) +
      parseFloat(currentCarrier.get('processingFee')) +
      parseFloat(parcelWeight) *
      parseFloat(currentCarrier.get('pricePerUnit'))
      @set 'isValid', true
      "TOTAL: $#{total}"
  ).property('App.parcel.weight', 'App.currentCarrierName')
