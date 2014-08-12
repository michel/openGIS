'use strict';

class Demo.Collections.Layers extends Backbone.Collection
  model: Demo.Models.Layer

  initialize: (res,options) ->
    super

  @DemoLayers: ->
    demo_layers = [
      {
        name: 'Defensie zone'
        layer_name: ['zone_defensie_a','zone_defensie_b','zone_defensie_c']
        layer_url: "http://rk-pub.idgis.nl/rk_services_pub/services/WMS-risicokaart"
      },
      {
        name: 'Inrichtingen'
        layer_name: ['p_LPG','p_opslag','p_ammoniak','p_vervoer']
        layer_url: "http://rk-pub.idgis.nl/rk_services_pub/services/WMS-risicokaart"
      }
    ]
    new Layers(demo_layers)
