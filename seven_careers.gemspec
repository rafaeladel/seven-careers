$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seven_careers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seven_careers"
  s.version     = SevenCareers::VERSION
  s.authors     = ["ahmednagy"]
  s.email       = ["ahmednagy14@gmail.com"]
  s.homepage    = "https://github.com:rafaeladel/seven-careers.git"
  s.summary     = "Summary of SevenCareers."
  s.description = "Description of SevenCareers."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "mysql2"
  s.add_dependency "carrierwave"
end
