# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Server Model', ->
  beforeEach ->
    @ServerModel = new Demo.Models.Server();
