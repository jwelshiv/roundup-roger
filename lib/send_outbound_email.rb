class SendOutboundEmail
  def self.call(email)
    Pony.mail({
      :to => email.to.join(", "),
      :from => ENV['EMAIL_FROM'], 
      :subject => email.subject, 
      :body => email.body,
      :via => :smtp,
      :via_options => {
        :address        => ENV['SMTP_ADDRESS'],
        :port           => ENV['SMTP_PORT'],
        :user_name      => ENV['SMTP_USER_NAME'],
        :password       => ENV['SMTP_PASSWORD'],
        :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
      }
    })
  end
end
