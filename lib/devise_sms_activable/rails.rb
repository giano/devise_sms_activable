module DeviseSmsActivable
  class Engine < ::Rails::Engine

    ActiveSupport.on_load(:action_controller) { include DeviseSmsActivable::Controllers::UrlHelpers }
    ActiveSupport.on_load(:action_view)       { include DeviseSmsActivable::Controllers::UrlHelpers }

  end
end
