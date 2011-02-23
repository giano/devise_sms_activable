module DeviseSmsActivable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Add DeviseSmsActivable config variables to the Devise initializer and copy DeviseSms locale files to your application."
      
      # def devise_install
      #   invoke "devise:install"
      # end
      
      def add_config_options_to_initializer
        devise_initializer_path = "config/initializers/devise.rb"
        if File.exist?(devise_initializer_path)
          old_content = File.read(devise_initializer_path)
          
          if old_content.match(Regexp.new(/^\s# ==> Configuration for :sms_activable\n/))
            false
          else
            inject_into_file(devise_initializer_path, :before => "  # ==> Configuration for :confirmable\n") do
<<-CONTENT
  # ==> Configuration for :sms_activable
  # The period the generated sms token is valid, after
  # this period, the user won't be able to activate.
  # config.sms_confirm_within = 0.days

  # The keys searched for confirmation values.
  # config.sms_confirmation_keys = [:email]
  
  # Your SmsSender class. The provided one uses 
  # moonshado-sms gem so install it and configure
  # if you want to use it.
  # A simple instance of the class has been copied in your lib folder
  # For further informations on using and configuring moonshado-sms gem check
  # https://github.com/moonshado/moonshado-sms
  # config.sms_sender = "Devise::SmsSender"
  
CONTENT
            end
          end
        end
      end
      
      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/devise_sms_activable.en.yml"
      end
      
      def copy_default_smser
        copy_file "lib/sms_sender.rb", "lib/devise_sms_sender.rb"
      end
    end
  end
end