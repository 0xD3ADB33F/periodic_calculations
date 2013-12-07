$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "periodic_calculations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "periodic_calculations"
  s.version     = PeriodicCalculations::VERSION
  s.authors     = ["Pol"]
  s.email       = ["polmiro@gmail.com"]
  s.homepage    = "https://github.com/polmiro/periodic_calculations"
  s.summary     = "Retrieve periodic stats in periods of time"
  s.description = "Periodic Calculations gem allows you to retrieve periodic results of aggregates that can be accumulated over time with PostgreSQL."
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "railties"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "pg"
  s.add_development_dependency "coveralls"
end
