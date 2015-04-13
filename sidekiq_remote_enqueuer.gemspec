# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq_remote_enqueuer/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq_remote_enqueuer"
  spec.version       = Sidekiq::RemoteEnqueuer::VERSION
  spec.authors       = ["Geison Biazus"]
  spec.email         = ["geisonbiazus@gmail.com"]
  spec.description   = "Simple Sidekiq Add-on to enqueue jobs to other applications."
  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'sidekiq'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
