App.Parcel = Ember.Object.extend
  weight: null
  length: null
  height: null
  width: null
  total: (->
    total = parseFloat(@get('weight')) + parseFloat(@get('length')) + parseFloat(@get('height')) + parseFloat(@get('width'))
  ).property('weight', 'length', 'height', 'width')
