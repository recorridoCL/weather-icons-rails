module WeatherIcons
  module Rails
    module Rails
      module IconHelpers
        # Creates an icon tag given an icon name and possible icon
        # modifiers.
        #
        # Examples
        #
        #   wi_icon "camera-retro"
        #   # => <i class="wi wi-camera-retro"></i>
        #
        #   wi_icon "camera-retro", text: "Take a photo"
        #   # => <i class="wi wi-camera-retro"></i> Take a photo
        #
        #   wi_icon "camera-retro 2x"
        #   # => <i class="wi wi-camera-retro wi-2x"></i>
        #   wi_icon ["camera-retro", "4x"]
        #   # => <i class="wi wi-camera-retro wi-4x"></i>
        #   wi_icon "spinner spin lg"
        #   # => <i class="wi wi-spinner wi-spin wi-lg">
        #
        #   wi_icon "quote-left 4x", class: "pull-left"
        #   # => <i class="wi wi-quote-left wi-4x pull-left"></i>
        #
        #   wi_icon "user", data: { id: 123 }
        #   # => <i class="wi wi-user" data-id="123"></i>
        #
        #   content_tag(:li, wi_icon("check li", text: "Bulleted list item"))
        #   # => <li><i class="wi wi-check wi-li"></i> Bulleted list item</li>
        def wi_icon(names = "flag", options = {})
          classes = ['wi ']
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
        #   wi_stacked_icon "twitter", base: "square-o"
        #   # => <span class="wi-stack">
        #   # =>   <i class="wi wi-square-o wi-stack-2x"></i>
        #   # =>   <i class="wi wi-twitter wi-stack-1x"></i>
        #   # => </span>
        #
        #   wi_stacked_icon "terminal inverse", base: "square", class: "pull-right", text: "Hi!"
        #   # => <span class="wi-stack pull-right">
        #   # =>   <i class="wi wi-square wi-stack-2x"></i>
        #   # =>   <i class="wi wi-terminal wi-inverse wi-stack-1x"></i>
        #   # => </span> Hi!
        #
        #   wi_stacked_icon "camera", base: "ban-circle", reverse: true
        #   # => <span class="wi-stack">
        #   # =>   <i class="wi wi-camera wi-stack-1x"></i>
        #   # =>   <i class="wi wi-ban-circle wi-stack-2x"></i>
        #   # => </span>
        def wi_stacked_icon(names = "flag", options = {})
          classes = Private.icon_names("stack").concat(Array(options.delete(:class)))
          base_names = Private.array_value(options.delete(:base) || "square-o").push("stack-2x")
          names = Private.array_value(names).push("stack-1x")
          base = wi_icon(base_names, options.delete(:base_options) || {})
          icon = wi_icon(names, options.delete(:icon_options) || {})
          icons = [base, icon]
          icons.reverse! if options.delete(:reverse)
          text = options.delete(:text)
          stacked_icon = content_tag(:span, safe_join(icons), options.merge(:class => classes))
          Private.icon_join(stacked_icon, text)
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
