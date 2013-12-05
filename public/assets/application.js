(function() {
  window.App = Ember.Application.create({
    title: "Parcel Delivery"
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
    LOG_TRANSITIONS: true
  });

}).call(this);
