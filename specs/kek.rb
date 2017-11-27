require 'json'
require 'pry'
@json = JSON.parse(File.read('../settings.json'))
binding.pry
puts @json["email"]