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

  initialize: (attributes)->
    super
    @server = attributes.server
    @renderMap()
    @collection.on 'change', =>
      @renderMap()

  renderMap: ->
    for layer in Demo.Map.layers
      if layer && layer.params && layer.params['INITAL_LAYER'] == true
        Demo.Map.removeLayer layer
      if layer && layer.params && layer.params['SERVER'] == @server
        Demo.Map.removeLayer layer

    layers = []
    for model in @collection.models when model.get('on')
      layers = layers.concat model.get('layer_name')
    if layers.length > 0
      layer = new OpenLayers.Layer.WMS(model.get('name'), @server.get('url'), isBaseLayer: false, layers: layers, format: "image/png", srs: "EPSG:28992", styles: "" , transitionEffect: "resize", transparent: true, server: @server)
      Demo.Map.addLayer(layer)


