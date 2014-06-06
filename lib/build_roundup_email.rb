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
      "<h4>#{email.from_name}:</h4><p>#{email.stripped_body}</p><br /><p style='padding-bottom:10px; border-bottom:1px dotted #333;'>#{separator}</p><br />"
    end.join
  end

  def subject
    "Roundup for #{(1.business_day.before(current_time)).strftime("%A, %-d %B")}"
  end

  def separator
    [
      "¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>",
      "┏(-_-)┛┗(-_-﻿ )┓┗(-_-)┛┏(-_-)┓",
      "♪┏(°.°)┛┗(°.°)┓┗(°.°)┛┏(°.°)┓ ♪",
      "▇ ▅ █ ▅ ▇ ▂ ▃ ▁ ▁ ▅ ▃ ▅ ▅ ▄ ▅ ▇",
      "°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸"
      ].sample
  end
end
