class SendOutboundEmail
  def self.call(email)
    Pony.mail({
      :to => email.to,
      :from => ENV['EMAIL_FROM'], 
      :subject => email.subject, 
      :headers => { "Content-Type" => "multipart/mixed" },
      :body => email.body,
      :html_body => email.body,
      :via => :smtp,
      :via_options => {
        :address        => ENV['SMTP_ADDRESS'],
        :port           => ENV['SMTP_PORT'],
        :enable_starttls_auto => true, 
        :user_name      => ENV['SMTP_USER_NAME'],
        :password       => ENV['SMTP_PASSWORD'],
        :authentication => :plain # :plain, :login, :cram_md5, no auth by default
      }
    })
  end
end
