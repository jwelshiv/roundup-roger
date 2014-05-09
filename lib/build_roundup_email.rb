class BuildRoundupEmail
  def self.call(*args)
    new(*args).call
  end

  def initialize(recipients, current_time=Time.now)
    @recipients = recipients
    @current_time = current_time
  end

  attr_reader :current_time, :recipients

  def call
    OutboundEmail.new(to: recipients, body: body, subject: subject)
  end

  private

  def body
    Email.last_24_hours(current_time).map do |email|
      "#{email.from_name}

#{email.stripped_body}"
    end.join("\n------------------------\n\n")
  end

  def subject
    "Roundup for #{current_time.strftime("%A, %-d %B")}"
  end
end
