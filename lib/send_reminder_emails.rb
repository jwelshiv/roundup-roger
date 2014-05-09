class SendReminderEmails
  def self.call
    email = BuildReminderEmail.call(ENV['EMAIL_TO'])
    SendOutboundEmail.call(email)
  end
end
