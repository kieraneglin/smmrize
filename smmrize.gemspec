# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require 'smmrize/version'

Gem::Specification.new do |s|
  s.name        = 'smmrize'
  s.version     = '0.1.1'
  s.date        = '2016-04-26'
  s.summary     = "Smmrize"
  s.description = "A dead-simple way to communicate with the SMMRY API"
  s.authors     = ["Kieran Eglin"]
  s.email       = 'kieran.eglin@gmail.com'
  s.files       = ["lib/smmrize.rb"]
  s.homepage    = 'https://github.com/kieraneglin/smmrize'
  s.license     = 'MIT'
  s.files       = Dir["{lib}/**/*"]
end
