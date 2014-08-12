'use strict';

class Demo.Models.Server extends Backbone.Model
  defaults:
    on: true
  initialize: ->
    @layers = new Demo.Collections.Layers(@get('layers'))
