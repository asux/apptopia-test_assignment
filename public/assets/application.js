(function() {
  window.App = Ember.Application.create();

}).call(this);
(function() {
  App.Carrier = Ember.Object.extend({
    name: null,
    processingFee: null,
    pricePerUnit: null,
    maxWeight: null,
    isOverloaded: (function() {
      return parseFloat(App.parcel.get('weight')) > parseFloat(this.get('maxWeight'));
    }).property('App.parcel.weight')
  });

}).call(this);
(function() {
  App.Parcel = Ember.Object.extend({
    weight: null,
    length: null,
    height: null,
    width: null
  });

}).call(this);
(function() {
  App.ApplicationController = Ember.Controller.extend();

}).call(this);
(function() {
  App.IndexController = App.ApplicationController.extend({
    isValid: false,
    total: (function() {
      var currentCarrier, parcelWeight, total;
      currentCarrier = App.carriers.filter(function(item) {
        return item.name === App.currentCarrierName;
      })[0];
      parcelWeight = App.parcel.get('weight');
      if (isNaN(parcelWeight) || parcelWeight === '' || parcelWeight === null) {
        this.set('isValid', false);
        return "Enter parcel weight as a number.";
      } else if (!currentCarrier) {
        this.set('isValid', false);
        return "Select the carrier.";
      } else if (currentCarrier.get('isOverloaded')) {
        this.set('isValid', false);
        return "This parcel is over processing limits for " + (currentCarrier.get('name')) + ".";
      } else {
        total = parseFloat(App.processingFee) + parseFloat(currentCarrier.get('processingFee')) + parseFloat(parcelWeight) * parseFloat(currentCarrier.get('pricePerUnit'));
        this.set('isValid', true);
        return "TOTAL: $" + total;
      }
    }).property('App.parcel.weight', 'App.currentCarrierName')
  });

}).call(this);
(function() {
  App.CarrierRadioButton = Ember.View.extend({
    title: null,
    checked: false,
    group: "carriers",
    disabled: false,
    classNames: ['carrier-radio-button'],
    defaultTemplate: Ember.Handlebars.compile('<label {{bindAttr class="view.disabled:disabled:enabled"}}><input type="radio" {{ bindAttr disabled="view.disabled" name="view.group" value="view.option" checked="view.checked"}} />{{view.title}}</label>'),
    bindingChanged: (function() {
      if (this.get("option") === Ember.get(this, 'value')) {
        return this.set("checked", true);
      }
    }).observes("value"),
    change: function() {
      return Ember.run.once(this, this._updateElementValue);
    },
    _updateElementValue: function() {
      var input;
      input = this.$('input:radio');
      return Ember.set(this, 'value', input.attr('value'));
    }
  });

}).call(this);
(function() {
  App.Router.map(function() {});

}).call(this);
(function() {
  App.Router.reopen({
    location: 'history'
  });

  App.reopen({
    rootElement: '#container',
    parcel: App.Parcel.create(),
    processingFee: 15,
    currentCarrierName: null,
    carriers: [
      App.Carrier.create({
        name: 'EMS',
        processingFee: 10,
        pricePerUnit: 1.5,
        maxWeight: 30
      }), App.Carrier.create({
        name: 'Priority',
        processingFee: 15,
        pricePerUnit: 5,
        maxWeight: 22
      }), App.Carrier.create({
        name: 'Courier',
        processingFee: 20,
        pricePerUnit: 15,
        maxWeight: 10
      })
    ]
  });

}).call(this);
