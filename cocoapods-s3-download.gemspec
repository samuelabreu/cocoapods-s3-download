# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-s3-download/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-s3-download'
  spec.version       = CocoapodsS3Download::VERSION
  spec.authors       = ['Samuel Abreu']
  spec.email         = ['sdepaula@gmail.com']
  spec.description   = %q{Host pods files on AWS S3 and download them using pre-signed URL.}
  spec.summary       = %q{AWS S3 files dont support any authentication method cocoapods support, to allow use it as a source of a private pod, this plugin uses AWS Ruby SDK to generate a presigned URL of a object and use it to download, more here: https://docs.aws.amazon.com/AmazonS3/latest/dev/ShareObjectPreSignedURL.html.}
  spec.homepage      = 'https://github.com/samuelabreu/cocoapods-s3-download'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'aws-sdk-s3', '~> 1'
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 12.3.3'
end
