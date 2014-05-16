require 'roundup_roger'

describe SendRoundupEmail do
  it "sends when there are emails to roundup" do
    Email.create(body: "hi there")
    expect(SendOutboundEmail).to receive :call
    SendRoundupEmail.call
  end

  it "doesn't send when there are no emails in the last 24 hours" do
    DB[:emails].delete
    expect(SendRoundupEmail.call).to be_nil
  end
end
