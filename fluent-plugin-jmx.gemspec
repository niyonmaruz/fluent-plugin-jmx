# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fluent-plugin-jmx'
  spec.version       = '0.0.1'
  spec.authors       = ['Hidenori Suzuki']
  spec.email         = ['hidenori.suzuki@yahoo.com']
  spec.summary       = 'a fluent plugin'
  spec.description   = 'jolokia input plugin'
  spec.homepage      = 'https://github.com/6pongi/fluent-plugin-jmx'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'fluentd', '~> 1.2.6'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'rspec'
end
