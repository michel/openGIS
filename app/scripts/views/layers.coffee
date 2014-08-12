class Demo.Views.Layer extends Backbone.Marionette.ItemView
  template: JST['app/scripts/templates/layer.ejs']
  tagName: 'li'

  events:
    'click': 'toggle'

  initialize: ->
    @model.on 'change', =>
      @render()

  toggle: ->
    @model.set('on',!@model.get('on'))

class Demo.Views.Layers extends Backbone.Marionette.CollectionView
  className: 'layers'
  tagName: 'ul'

  childView: Demo.Views.Layer


