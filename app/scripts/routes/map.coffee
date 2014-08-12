'use strict'

class Demo.Routers.Map extends Backbone.Router
   routes:
     '': 'home'
     'menu': 'menu'

   home: ->
    Demo.App.Menu.show new Demo.Views.MenuButton()

   menu: ->
    Demo.App.Menu.show new Demo.Views.Menu(model: Demo.Servers)

