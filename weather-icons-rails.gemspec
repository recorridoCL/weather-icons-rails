# -*- encoding: utf-8 -*-
require File.expand_path('../lib/weather-icons-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["cody"]
  gem.email         = ["cody@csc8.com"]
  gem.description   = "I like font-awesome, weather-icons, and rails. So I am doing my best to combine weather-icons into an easy to use gem."
  gem.summary       = "an asset gemification of the font-awesome icon font library"
  gem.homepage      = "https://github.com/CodySchaaf/weather-icons"
  gem.licenses      = ["MIT", "SIL Open Font License"]

  gem.files         = Dir["{app,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  gem.test_files    = Dir["test/**/*"]
  gem.name          = "font-awesome-rails"
  gem.require_paths = ["lib"]
  gem.version       = WeatherIconsRails::VERSION

  gem.add_dependency "railties", ">= 3.2", "< 5.0"

  gem.add_development_dependency "activesupport"
  gem.add_development_dependency "sass-rails"
end
