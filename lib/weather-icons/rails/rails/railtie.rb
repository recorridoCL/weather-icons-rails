require "weather-icons/rails/rails/helpers"

module WeatherIcons
  module Rails
    module Rails
      class Railtie < ::Rails::Railtie
       initializer "weather-icons-rails.view_helpers" do
          ActionView::Base.send :include, IconHelpers
        end
      end
    end
  end
end
