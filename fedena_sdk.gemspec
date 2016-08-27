# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fedena_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'fedena_sdk'
  spec.version       = FedenaSdk::VERSION
  spec.authors       = ['Aboobacker MK']
  spec.email         = ['aboobackervyd@gmail.com']

  spec.summary       = 'Ruby wrapper for fedena api'
  spec.description   = 'Fedena is a complete school management software and system with features like: timetable, attendance, parent-teacher-student communication and a lot more'
  spec.homepage      = 'https://github.com/tachyons/fedena-sdk-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'oauth2'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'simplecov'
end
