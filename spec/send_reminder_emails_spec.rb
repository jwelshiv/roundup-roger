require 'roundup_roger'

describe SendReminderEmails do
  it "works" do
    expect(SendOutboundEmail).to receive(:call).exactly(2).times
    SendReminderEmails.call
  end
end
