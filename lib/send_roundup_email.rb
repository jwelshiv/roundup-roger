class SendRoundupEmail
  def self.call
    if Email.last_24_hours(Time.now).any?
      email = BuildRoundupEmail.call(ENV['EMAIL_TO'])
      SendOutboundEmail.call(email)
    end
  end
end
