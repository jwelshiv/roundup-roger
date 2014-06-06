class BuildReminderEmail
  def self.call(*args)
    new(*args).call
  end

  def initialize(recipient, current_time=Time.now)
    @recipient = recipient
    @current_time = current_time
  end

  attr_reader :recipient, :current_time

  def call
    OutboundEmail.new(to: recipient, body: body, subject: subject)
  end

  private

  def body
    ""
  end

  def subject
    "What did you do today? Standup Reminder for #{current_time.strftime("%A, %-d %B")}"
  end
end
