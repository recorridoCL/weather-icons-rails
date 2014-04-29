require 'weather-icons/rails/helpers'

module WeatherIcons
  module Rails
    class Railtie < ::Rails::Railtie
     initializer "weather-icons-rails.view_helpers" do
        ActionView::Base.send :include, IconHelpers
      end
    end
  end
end
