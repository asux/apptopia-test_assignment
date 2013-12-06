App.Carrier = Ember.Object.extend
  name: null
  processingFee: null
  pricePerUnit: null
  maxWeight: null

  isOverloaded: (->
    parseFloat(App.parcel.get('weight')) > parseFloat(@get('maxWeight'))
  ).property('App.parcel.weight')
