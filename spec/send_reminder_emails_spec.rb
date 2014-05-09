require 'roundup_roger'

describe SendReminderEmails do
  it "works" do
    expect(SendOutboundEmail).to receive(:call)
    SendReminderEmails.call
  end
end
