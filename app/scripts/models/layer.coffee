'use strict';

class Demo.Models.Layer extends Backbone.Model
  url: '',

  initialize: () ->

  defaults:
    name: ''
    layer_name: ''
    address: ''

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
