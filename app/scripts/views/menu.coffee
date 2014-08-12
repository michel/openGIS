'use strict';

class Demo.Views.Menu extends Backbone.Marionette.CompositeView
  template: JST['app/scripts/templates/menu.ejs']
  events:
    'click #menu-button': 'close'

  render: ->
    super
    @.$('#menu-content #servers').html( new Demo.Views.Servers(collection: @model).render().el )
    setTimeout ->
      @.$('#menu-content').addClass('open')


  close: ->
    @.$('#menu-content').removeClass('open').promise().done ->
      Demo.Router.navigate('', true)

