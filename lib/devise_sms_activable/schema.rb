module DeviseSmsActivable
  module Schema
  
    def sms_activable
      apply_devise_schema :phone,   String
      apply_devise_schema :sms_confirmation_token,   String, :limit => 5
      apply_devise_schema :confirmation_sms_sent_at, DateTime
      apply_devise_schema :sms_confirmed_at, DateTime
    end
  end
end

Devise::Schema.send :include, DeviseSmsActivable::Schema