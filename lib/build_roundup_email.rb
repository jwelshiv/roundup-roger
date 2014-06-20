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
    Email.last_business_day(current_time).map do |email|
      "<h4>#{email.from_name}:</h4><p>#{email.stripped_body}</p><br /><p style='padding-bottom:10px; border-bottom:1px dotted #333;'><span style='font-weight: bold;'>#{separator}</span></p><br />"
    end.join
  end

  def subject
    "Roundup for #{(1.business_day.before(current_time)).strftime("%A, %-d %B")}"
  end

  def separator
    [
      "█║▌│ █│║▌ ║││█║▌ │║║█║ │║║█║ █│║▌",
      "▇ ▅ █ ▅ ▇ ▂ ▃ ▁ ▁ ▅ ▃ ▅ ▅ ▄ ▅",
      "▀▄▀Make something people want▄▀▄",
      "★★★★★★★★★★★★★★★★★★",
      "",
      ].sample
  end
end
[

      ].sample
