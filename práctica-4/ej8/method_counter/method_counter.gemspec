require_relative 'lib/method_counter/version'

Gem::Specification.new do |spec|
  spec.name          = "method_counter"
  spec.version       = MethodCounter::VERSION
  spec.authors       = ["nuricz"]
  spec.email         = ["nuria.czajko@gmail.com"]

  spec.summary       = %q{Gem to count called methods for a class}
  spec.description   =  spec.summary
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
