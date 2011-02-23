class Devise::SmsSender
  def self.send_sms(phone,message)
    sms = Moonshado::Sms.new(phone, message)
    return sms.deliver_sms[:stat]
  end
end
