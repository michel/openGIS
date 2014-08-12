# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Servers Collection', ->
  beforeEach ->
    @ServersCollection = new Demo.Collections.Servers()
