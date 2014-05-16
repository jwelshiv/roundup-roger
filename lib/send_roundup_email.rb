class SendRoundupEmail
  def self.call(*args)
    new(*args).call
  end

  def initialize(current_time=Time.now)
    @current_time = current_time
  end

  attr_reader :current_time

  def call
    if is_business_day? && Email.last_business_day(current_time).any?
      email = BuildRoundupEmail.call(ENV['EMAIL_TO'])
      SendOutboundEmail.call(email)
    end
  end

  def is_business_day?
    not (current_time.saturday? || current_time.sunday?)
  end
end
