# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-s3-download/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-s3-download'
  spec.version       = CocoapodsS3Download::VERSION
  spec.authors       = ['Samuel Abreu']
  spec.email         = ['sdepaula@gmail.com']
  spec.description   = %q{A short description of cocoapods-s3-download.}
  spec.summary       = %q{A longer description of cocoapods-s3-download.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-s3-download'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
