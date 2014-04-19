module WeatherIcons
  module Rails
    module Rails
      module IconHelpers
        # Creates an icon tag given an icon name and possible icon
        # modifiers.
        #
        # Examples
        #
        #   wi_icon "day-hail"
        #   # => <i class="wi wi-day-hail"></i>
        #
        #   wi_icon "day-hail", text: "Hailing Outside!"
        #   # => <i class="wi wi-day-hail"></i> Hailing Outside
        #
        #   wi_icon "day-hail 2x"
        #   # => <i class="wi wi-day-hail wi-2x"></i>
        #   wi_icon ["day-hail", "4x"]
        #   # => <i class="wi wi-day-hail wi-4x"></i>
        #   wi_icon "wi-day-hail spin lg"
        #   # => <i class="wi wi-day-hail wi-spin wi-lg">
        #
        #   wi_icon "day-hail 4x", class: "pull-left"
        #   # => <i class="wi wi-day-hail wi-4x pull-left"></i>
        #
        #   wi_icon "day-hail", data: { id: 123 }
        #   # => <i class="wi wi-day-hail" data-id="123"></i>
        #
        #   content_tag(:li, wi_icon("day-hail li", text: "Bulleted list item"))
        #   # => <li><i class="wi wi-day-hail wi-li"></i> Bulleted list item</li>
        def wi_icon(names = "flag", options = {})
          classes = ['wi']
          classes.concat Private.icon_names(names)
          classes.concat Array(options.delete(:class))
          text = options.delete(:text)
          icon = content_tag(:i, nil, options.merge(:class => classes))
          Private.icon_join(icon, text)
        end

        # Creates an stack set of icon tags given a base icon name, a main icon
        # name, and possible icon modifiers.
        #
        # Examples
        #
        #   wi_stacked_icon "day-hail", base: "day-cloudy-gusts"
        #   # => <span class="wi-stack">
        #   # =>   <i class="wi wi-day-cloudy-gusts wi-stack-2x"></i>
        #   # =>   <i class="wi wi-day-hail wi-stack-1x"></i>
        #   # => </span>
        #
        #   wi_stacked_icon "day-hail inverse", base: "lightning", class: "pull-right", text: "Hi!"
        #   # => <span class="wi-stack pull-right">
        #   # =>   <i class="wi wi-lightning wi-stack-2x"></i>
        #   # =>   <i class="wi wi-day-hail wi-inverse wi-stack-1x"></i>
        #   # => </span> Hi!
        #
        #   wi_stacked_icon "lightning", base: "day-cloudy-gusts", reverse: true
        #   # => <span class="wi-stack">
        #   # =>   <i class="wi wi-lightning wi-stack-1x"></i>
        #   # =>   <i class="wi wi-day-cloudt-gusts wi-stack-2x"></i>
        #   # => </span>
        def wi_stacked_icon(names = "flag", options = {})
          classes = Private.icon_names("stack").concat(Array(options.delete(:class)))
          base_names = Private.array_value(options.delete(:base) || "wi-lightning").push("stack-2x")
          names = Private.array_value(names).push("stack-1x")
          base = wi_icon(base_names, options.delete(:base_options) || {})
          icon = wi_icon(names, options.delete(:icon_options) || {})
          icons = [base, icon]
          icons.reverse! if options.delete(:reverse)
          text = options.delete(:text)
          stacked_icon = content_tag(:span, safe_join(icons), options.merge(:class => classes))
          Private.icon_join(stacked_icon, text)
        end

        # Creates a list item with the specified icon as the marker.
        # To be used with an ul tag having a class of wi-ul
        #
        # Examples
        #
        #   wi_list_item('day-hail', 'Bad Weather Today')
        #   # => <li><i class="wi wi-day-hail wi-li"></i> Bad Weather Today</li>
        #
        #   wi_list_item('day-hail md', 'Bad Weather Today', icon_options: {class: 'inverse'}, class: 'something' )
        #   # => <li class="something"><i class="wi wi-day-hail wi-md wi-li inverse"></i> Bad Weather Today</li>
        def wi_list_item(icon_name, string, options={})
          icons_options = {text: string}.merge(Hash(options[:icon_options]))
          content_tag(:li, wi_icon("#{icon_name} li", icons_options), options.reject{|key,value| key == :icon_options})
        end

        # Creates an unordered list with the specified icon as the markers.
        #
        # Examples
        #
        #   wi_list('day-hail', ['Bad Weather', 'Good Weather'])
        #   # => <ul class: 'wi-ul'>
        #   # =>   <li>
        #   # =>     <i class="wi wi-day-hail wi-li"></i> Bad Weather
        #   # =>   </li>
        #   # =>   <li>
        #   # =>     <i class="wi wi-day-hail wi-li"></i> Good Weather
        #   # =>   </li>
        #   # => </ul>
        #
        #   wi_list('day-hail lg', ['Bad Weather', 'Good Weather'], icon_options: {class: 'pull-right'}, class: 'something' )
        #   # => <ul class: 'wi-ul'>
        #   # =>   <li class="something">
        #   # =>     <i class="wi wi-day-hail wi-lg wi-li pull-right"></i> Bad Weather
        #   # =>   </li>
        #   # =>   <li class="something">
        #   # =>     <i class="wi wi-day-hail wi-lg wi-li pull-right"></i> Good Weather
        #   # =>   </li>
        #   # => </ul>
        def wi_list(icon_name, strings, options={})
          list_items = strings.map { |str| wi_list_item(icon_name, str, options) }
          content_tag(:ul, safe_join(list_items), class: Private.icon_names('ul'))
        end

        module Private
          extend ActionView::Helpers::OutputSafetyHelper

          def self.icon_join(icon, text)
            return icon if text.blank?
            safe_join([icon, ERB::Util.html_escape(text)], " ")
          end

          def self.icon_names(names = [])
            array_value(names).map { |n| "wi-#{n}" }
          end

          def self.array_value(value = [])
            value.is_a?(Array) ? value : value.to_s.split(/\s+/)
          end
        end
      end
    end
  end
end
