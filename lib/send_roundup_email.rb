TEAM_MEMBERS = {
  "Philippe Creux" => "pcreux@gmail.com",
  "Jenn Cooper" => "cooper.jennl@gmail.com"
}

class SendRoundupEmail
  def self.call
    email = BuildRoundupEmail.call(TEAM_MEMBERS)
    SendOutboundEmail.call(email)
  end
end
