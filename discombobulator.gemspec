# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "discombobulator"
  spec.version       = "0.1.2"
  spec.authors       = ["Paweł Obrok", "Norbert Wojtowicz"]
  spec.email         = ["pawel.obrok@gmail.com", "wojtowicz.norbert@gmail.com"]
  spec.summary       = "Discombobulate for the greater good!"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/obrok/discombobulator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "rake"
end
