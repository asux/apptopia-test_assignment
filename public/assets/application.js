(function() {
  window.App = Ember.Application.create();

}).call(this);
(function() {
  App.Parcel = Ember.Object.extend({
    weight: null,
    length: null,
    height: null,
    width: null,
    total: (function() {
      var total;
      return total = parseFloat(this.get('weight')) + parseFloat(this.get('length')) + parseFloat(this.get('height')) + parseFloat(this.get('width'));
    }).property('weight', 'length', 'height', 'width')
  });

}).call(this);
(function() {
  App.ApplicationController = Ember.Controller.extend();

}).call(this);
(function() {
  App.IndexController = App.ApplicationController.extend();

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
    LOG_TRANSITIONS: true,
    parcel: App.Parcel.create()
  });

}).call(this);
