# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/beats/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-beats'
  s.version  = OmniAuth::Beats::VERSION
  s.authors  = ['Lee Martin']
  s.email    = ['hi@leemartin.com']
  s.summary  = 'Beats Music strategy for OmniAuth'
  s.homepage = 'https://github.com/leemartin/omniauth-beats'
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
end
