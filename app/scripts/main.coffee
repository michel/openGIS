window.Demo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    @App = new Marionette.Application

    @App.addRegions
      Menu: '#menu'

    @App.addInitializer (options) ->
      menuView = new Demo.Views.MenuButton()
      Demo.App.Menu.show menuView
      Demo.Router = new Demo.Routers.Map()
      Demo.mappingModule(OpenLayers)
      Backbone.history.start({pushState: false})
     @App

  mappingModule: (ol) ->
    @Map = new ol.Map("map",
      maxExtent: new ol.Bounds(10000.0, 305000.0, 280000.0, 619000.0)
      projection: new ol.Projection("EPSG:28992")
    )

    osm_rd_tms_layer = new OpenLayers.Layer.TMS("osm-rd-TMS", "http://openbasiskaart.nl/mapcache/tms/",
      layername: "osm@rd"
      type: "png"
      serviceVersion: "1.0.0"
      gutter: 0
      buffer: 0
      isBaseLayer: true
      transitionEffect: "resize"
      tileOrigin: new OpenLayers.LonLat(-285401, 22598)
      resolutions: [
        3440.64
        1720.32
        860.16
        430.08
        215.04
        107.52
        53.76
        26.88
        13.44
        6.72
        3.36
        1.68
        0.84
        0.42
        0.21
      ]
      zoomOffset: 0
      units: "m"
      maxExtent: new ol.Bounds(10000.0, 305000.0, 280000.0, 619000.0)
      projection: new OpenLayers.Projection("EPSG:28992")
      sphericalMercator: false
      displayInLayerSwitcher: false
    )

    @Map.addLayer(osm_rd_tms_layer)
    base_layer = new OpenLayers.Layer.WMS('Buisleidingen', "http://rk-pub.idgis.nl/rk_services_pub/services/WMS-risicokaart", isBaseLayer: false, layers: ['trns_buisleidingen'], format: "image/png", srs: "EPSG:28992", styles: "" , transitionEffect: "resize", transparent: true, INITAL_LAYER: true)
    Demo.Map.addLayer(base_layer)
    #layer = new ol.Layer.WMS(model.get('name'), model.get('layer_url'), isBaseLayer: false, layers: model.get('layer_name'), format: "image/png", srs: "EPSG:28992", styles: "" , transitionEffect: "resize", transparent: true)
      #@map.addLayer(layer)

    point = new OpenLayers.LonLat(105206.800, 499184.800)
    @Map.setCenter(point, 8)
    @Map.events.register "click", @Map, (e) =>
      position = @Map.getLonLatFromPixel(e.xy);
      console.log position.lon.toFixed(3) + ', ' + position.lat.toFixed(3)


    @Servers = Demo.Collections.Servers.DemoServers()

$ ->
  'use strict'
  Demo.init().start()
