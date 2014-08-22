require "open-uri"
require 'rexml/document'
require 'rexml/xpath'
require 'json'

url = "http://www.milieu-info.nl/mapserver/mapserv.exe?map%3DD:%5Cinetpub%5Cnazca%5CProvincie_Noord_Holland%5CMDIJmondWaterland%5C_mapfile%5Cnazca_bis_wms.map"
capabilities = "#{url}?VERSION=1.1.1&REQUEST=GetCapabilities&SERVICE=WMS&"
#file = open(capabilities).read
#File.open('/tmp/capabilities.xml','w') do |f|
  #f << file
#end
layers = []
file = File.open('/Users/micheldegraaf/Downloads/mapserv.xml').read
doc = REXML::Document.new file
server_name =  REXML::XPath.first( doc, "//Service//Title").text
REXML::XPath.each( doc, "//Layer/") do |layer|
  layer_name = layer.elements["Name"].to_a.first
  name = layer.elements["Title"].to_a.first
  layers << { name: name, layer_name: layer_name } if layer_name
end
server = {}
server['name'] = server_name
server['url'] = url
server['layers'] = layers
puts server.to_json

