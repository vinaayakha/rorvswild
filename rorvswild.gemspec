# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rorvswild/version'

Gem::Specification.new do |spec|
  spec.name          = "rorvswild"
  spec.version       = RorVsWild::VERSION
  spec.authors       = ["Alexis Bernard", "Antoine Marguerie", "Vinayak Iyer"]
  spec.email         = ["alexis@bernard.io", "antoine@basesecrete.com", "vinuyer@gmail.com"]
  spec.summary       = "Ruby on Rails applications monitoring"
  spec.description   = "Performances and errors insights for rails developers."
  spec.homepage      = "https://www.rorvswild.com"
  spec.license       = "MIT"

  spec.metadata["source_code_uri"] = "https://github.com/BaseSecrete/rorvswild"
  spec.metadata["changelog_uri"] = "https://github.com/BaseSecrete/rorvswild/blob/master/CHANGELOG.md"

  spec.files         = `git ls-files -z lib bin README.md LICENSE.txt cacert.pem`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
