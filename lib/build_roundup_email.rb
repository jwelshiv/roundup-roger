class BuildRoundupEmail
  def self.call(*args)
    new(*args).call
  end

  def initialize(team_members, current_time=Time.now)
    @team_members = team_members
    @current_time = current_time
  end

  attr_reader :current_time, :team_members

  def call
    OutboundEmail.new(to: recipients, body: body, subject: subject)
  end

  private

  def recipients
    team_members.map do |name, email|
      "#{name} <#{email}>"
    end
  end

  def body
    Email.last_24_hours(current_time).map do |email|
      "#{email.from_name} #{email.body}"
    end.join
  end

  def subject
    "Roundup for #{current_time.strftime("%A, %-d %B")}"
  end
end
