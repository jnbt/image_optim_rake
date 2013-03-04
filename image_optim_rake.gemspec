$:.push File.expand_path("../lib", __FILE__)
require "image_optim_rake/version"

Gem::Specification.new do |gem|
  gem.name        = "image_optim_rake"
  gem.version     = ImageOptimRake::VERSION
  gem.authors     = ["Jonas Thiel"]
  gem.email       = ["jonasthiel@googlemail.com"]
  gem.homepage    = "http://www.jonasthiel.de"
  gem.summary     = %q{Provide a little helper command to minify images}
  gem.description = %q{Provide a little helper command to minify images}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "image_optim", "~> 0.7.3"
  gem.add_dependency "rake"
  gem.add_dependency "progressbar", "~> 0.20.0"

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "testem"
end
