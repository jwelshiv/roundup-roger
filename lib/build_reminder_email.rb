class BuildReminderEmail
  def self.call(*args)
    new(*args).call
  end

  def initialize(team_member, current_time=Time.now)
    @team_member = team_member
    @current_time = current_time
  end

  attr_reader :team_member, :current_time

  def call
    OutboundEmail.new(to: recipient, body: body, subject: subject)
  end

  private

  def recipient
    team_member.map do |name, email|
      "#{name} <#{email}>"
    end
  end

  def body
    "What did you do today?"
  end

  def subject
    "Standup Reminder for #{current_time.strftime("%A, %-d %B")}"
  end
end
