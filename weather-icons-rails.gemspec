require File.expand_path('../lib/weather-icons-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Cody Schaaf"]
  gem.email         = ["cody@csc8.com"]
  gem.description   = "I like font-awesome, weather-icons, and rails. So I am doing my best to combine weather-icons into an easy to use gem."
  gem.summary       = "an asset gemification of the weather-icons icon font library"
  gem.homepage      = "https://github.com/CodySchaaf/weather-icons-rails"
  gem.licenses      = "MIT"
  gem.date          = '2014-04-15'

  gem.name          = "weather-icons-rails"
  gem.version       = WeatherIconsRails::VERSION
  gem.files         = Dir["{app,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  gem.test_files    = Dir["test/**/*"]
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", ">= 3.2", "< 5.0"

  gem.add_development_dependency "activesupport", '~> 0'
  gem.add_development_dependency "sass-rails",    '~> 0'
end
