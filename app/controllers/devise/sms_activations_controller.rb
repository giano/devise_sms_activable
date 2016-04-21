class Devise::SmsActivationsController < DeviseController

  # GET /resource/sms_activation/new
  def new
    build_resource({})
  end

  def create
    self.resource = resource_class.send_sms_token(params[resource_name])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message :notice, :send_token, :phone => self.resource.phone if is_flashing_format?
      respond_with({}, location: after_resending_sms_token_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/sms_activation/insert
  def insert
    build_resource({})
  end

  def consume
    self.resource = resource_class.confirm_by_sms_token(params[resource_name][:sms_confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message :notice, :confirmed if is_flashing_format?
      respond_with_navigational(resource){ redirect_to after_sms_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :insert }
    end
  end

  protected

    def build_resource(hash = nil)
      self.resource = resource_class.new
    end

    def after_resending_sms_token_path_for(resource_name)
      is_navigational_format? ? insert_sms_activation_path(resource_name) : '/'
    end

    def after_sms_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
      else
        new_session_path(resource_name)
      end
    end

end
