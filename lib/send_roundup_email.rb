class SendRoundupEmail
  def self.call
    email = BuildRoundupEmail.call(ENV['EMAIL_TO'])
    SendOutboundEmail.call(email)
  end
end
