'use strict';

class Demo.Views.MenuButton extends Backbone.Marionette.ItemView
  template: JST['app/scripts/templates/menu_button.ejs']
  id: 'menu-button'

  events:
    click: ->
      Demo.Router.navigate('menu', true)
