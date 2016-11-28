module DeviseSmsActivable
  module Controllers
    module UrlHelpers
      [:path, :url].each do |path_or_url|
        [nil, :new_, :consume_, :insert_].each do |action|
          class_eval <<-URL_HELPERS, __FILE__, __LINE__ + 1
            def #{action}sms_activation_#{path_or_url}(resource, *args)
              resource = case resource
                when Symbol, String
                  resource
                when Class
                  resource.name.underscore
                else
                  resource.class.name.underscore
              end

              send("#{action}\#{resource}_sms_activation_#{path_or_url}", *args)
            end
          URL_HELPERS
        end
      end
    end
  end
end
