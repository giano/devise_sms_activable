class Devise::SmsActivationsController < DeviseController

  # GET /resource/sms_activation/new
  def new
    build_resource({})
    render_with_scope :new
  end

  # POST /resource/sms_activation
  def create
    self.resource = resource_class.send_sms_token(params[resource_name])
    
    if resource.errors.empty?
      set_flash_message :notice, :send_token, :phone => self.resource.phone
      redirect_to new_session_path(resource_name)
    else
      render_with_scope :new
    end
  end
  
  # GET /resource/sms_activation/insert
  def insert
    build_resource({})
  end
  
  # GET or POST /resource/sms_activation/consume?sms_token=abcdef
  def consume
    self.resource = resource_class.confirm_by_sms_token(params[:sms_token])

    if resource.errors.empty?
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)
    else
      render_with_scope :new
    end
  end
  
  protected
  
    def build_resource(hash = nil)
      self.resource = resource_class.new
    end

end
