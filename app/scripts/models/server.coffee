'use strict';

class Demo.Models.Server extends Backbone.Model
  url: '',

  initialize: () ->

  defaults:
    name: ''

  validate: (attrs, options) ->

  parse: (response, options) ->
    response
