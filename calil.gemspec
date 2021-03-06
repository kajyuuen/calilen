# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calil/version'

Gem::Specification.new do |spec|
  spec.name          = "calilen"
  spec.version       = Calil::VERSION
  spec.authors       = ["kajyuuen"]
  spec.email         = ["kajyuuen@gmail.com"]

  spec.summary       = %q{Calil api wrapper.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kajyuuen/calil"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'json'
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'terminal-notifier-guard'
  spec.add_development_dependency 'factory_girl'

end
