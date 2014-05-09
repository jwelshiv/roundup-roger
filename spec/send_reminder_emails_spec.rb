require 'roundup_roger'

describe SendReminderEmails do
  it "works" do
    expect(SendOutboundEmail).to receive(:call).exactly(1).times
    SendReminderEmails.call
  end
end
