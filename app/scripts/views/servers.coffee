class Demo.Views.Server extends Backbone.Marionette.ItemView
  template: JST['app/scripts/templates/server.ejs']
  tagName: 'li'
  className: 'server'

  render: ->
    super
    @.$el.append( new Demo.Views.Layers(collection: @model.layers, server: @model).render().el )

class Demo.Views.Servers extends Backbone.Marionette.CollectionView
  childView: Demo.Views.Server


