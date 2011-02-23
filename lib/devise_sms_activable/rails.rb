module DeviseInvitable
  class Engine < ::Rails::Engine

    ActiveSupport.on_load(:action_controller) { include DeviseSmsActivable::Controllers::UrlHelpers }
    ActiveSupport.on_load(:action_view)       { include DeviseSmsActivable::Controllers::UrlHelpers }

    config.after_initialize do
    
    end

  end
end
