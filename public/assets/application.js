(function() {
  window.App = Ember.Application.create();

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
