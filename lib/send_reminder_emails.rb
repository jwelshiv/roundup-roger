class SendReminderEmails
  def self.call(*args)
    new(*args).call
  end

  def initialize(current_time=Time.now)
    @current_time = current_time
  end

  attr_reader :current_time

  def call
    if Email.is_business_day?(current_time)
      email = BuildReminderEmail.call(ENV['EMAIL_TO'])
      SendOutboundEmail.call(email)
    end
  end
end
