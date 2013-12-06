App.CarrierRadioButton = Ember.View.extend
  title: null
  checked: false
  group: "carriers"
  disabled: false

  classNames: ['carrier-radio-button']

  defaultTemplate: Ember.Handlebars.compile('<label {{bindAttr class="view.disabled:disabled:enabled"}}><input type="radio" {{ bindAttr disabled="view.disabled" name="view.group" value="view.option" checked="view.checked"}} />{{view.title}}</label>')

  bindingChanged: (->
    @set("checked", true) if @get("option") == Ember.get(this, 'value')
  ).observes("value")

  change: ->
    Ember.run.once(this, @_updateElementValue)

  _updateElementValue: ->
    input = this.$('input:radio')
    Ember.set(this, 'value', input.attr('value'))
