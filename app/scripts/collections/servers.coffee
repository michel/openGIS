'use strict';

class Demo.Collections.Servers extends Backbone.Collection
  model: Demo.Models.Server


  @DemoServers: ->
   new Servers [
      {
        name: 'risicokaart'
        url: 'http://rk-pub.idgis.nl/rk_services_pub/services/WMS-risicokaart'
      }
    ]
