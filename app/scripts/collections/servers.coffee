'use strict';

class Demo.Collections.Servers extends Backbone.Collection
  model: Demo.Models.Server

  @DemoServers: ->
   new Servers [
      {
        name: 'Risicokaart'
        url: 'http://rk-pub.idgis.nl/rk_services_pub/services/WMS-risicokaart'
        layers: [
          {
            name: 'Defensie zone'
            layer_name: ['zone_defensie_a','zone_defensie_b','zone_defensie_c']
          },
          {
            name: 'Inrichtingen'
            layer_name: ['p_LPG','p_opslag','p_ammoniak','p_vervoer']
          }
        ]
      },
      {
        name: 'milieu-info.nl (Nazca)'
        url: "http://www.milieu-info.nl/mapserver/mapserv.exe?map%3DD:%5Cinetpub%5Cnazca%5CProvincie_Noord_Holland%5CMDIJmondWaterland%5C_mapfile%5Cnazca_bis_wms.map"
        layers: [
          {
            name: 'Onderzoek'
            layer_name: 'Onderzoek'
          }
        ]

      }

    ]
