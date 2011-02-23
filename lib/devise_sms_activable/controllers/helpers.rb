module DeviseSmsActivable::Controllers::Helpers
  protected
  
  # Convenience helper to check if user has confirmed the token (and the phone) or not.
  def require_sms_activated!
    if(send(:"authenticate_#{resource_name}!"))
      res=send(:"current_#{resource_name}")
      fail!(:sms_activation_required) if (!res) || (!res.sms_confirmed?)
    end
  end
end
ActionController::Base.send :include, DeviseSmsActivable::Controllers::Helpers