App.IndexController = App.ApplicationController.extend
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
  isValid: false

  total: (->
    carriers = @get('carriers')
    currentCarrierName = @get('currentCarrierName')
    currentCarrier = carriers.filterBy('name', currentCarrierName)[0]
    parcelWeight = parseFloat App.get('parcel').get('weight')
    overloaded = carriers.filterBy('isOverloaded')
    if isNaN(parcelWeight)
      @set 'isValid', false
      "Enter parcel weight as a number."
    else if overloaded.length == carriers.length
      @set 'isValid', false
      "This parcel is over processing limits and could not be delivered."
    else if not currentCarrier
      @set 'isValid', false
      "Select the carrier."
    else if currentCarrier.get('isOverloaded')
      @set 'isValid', false
      "This parcel is over processing limits for #{currentCarrierName}, please select another carrier."
    else
      total = parseFloat(App.processingFee) +
      parseFloat(currentCarrier.get('processingFee')) +
      parcelWeight *
      parseFloat(currentCarrier.get('pricePerUnit'))
      @set 'isValid', true
      "TOTAL: $#{total}"
  ).property('App.parcel.weight', 'currentCarrierName', 'carriers.@each.isOverloaded')

