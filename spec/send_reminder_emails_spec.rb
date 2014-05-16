require 'roundup_roger'

describe SendReminderEmails do
  it "works" do
    expect(SendOutboundEmail).to receive(:call)
    SendReminderEmails.call
  end

  it "doesn't send on Saturday" do
    expect(SendOutboundEmail).to_not receive(:call)
    SendReminderEmails.call(Time.new(2014, 05, 03, 7))
  end

  it "does send on Monday" do
    expect(SendOutboundEmail).to receive(:call)
    SendReminderEmails.call(Time.new(2014, 05, 05, 7))
  end
end
