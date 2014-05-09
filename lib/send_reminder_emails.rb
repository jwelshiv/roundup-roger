class SendReminderEmails
  def self.call
    TEAM_MEMBERS.each do |team_member|
      email = BuildReminderEmail.call(team_member)
      SendOutboundEmail.call(email)
    end
  end
end
