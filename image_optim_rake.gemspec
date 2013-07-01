$:.push File.expand_path("../lib", __FILE__)
require "image_optim_rake/version"

Gem::Specification.new do |gem|
  gem.name        = "image_optim_rake"
  gem.version     = ImageOptimRake::VERSION
  gem.authors     = ["Jonas Thiel"]
  gem.email       = ["jonasthiel@googlemail.com"]
  gem.homepage    = "https://github.com/jnbt/image_optim_rake"
  gem.summary     = %q{Provide a little helper command to minify images}
  gem.description = %q{Provide a little helper command to minify images}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "image_optim", "~> 0.8.1"
  gem.add_dependency "rake"
  gem.add_dependency "powerbar", "~> 1.0.11"

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "testem"
end
