require 'roundup_roger'

describe SendRoundupEmail do
  it "sends when there are emails to roundup" do
    Email.create(body: "hi there")
    expect(SendOutboundEmail).to receive :call
    SendRoundupEmail.call(Time.now)
  end

  it "doesn't send when there are no emails in the last 24 hours" do
    DB[:emails].delete
    expect(SendRoundupEmail.call(Time.now)).to be_nil
  end

  it "doesn't send on Saturday, but sends on Monday instead" do
    DB[:emails].delete
    email = Email.create(body: "hi there", created_at: Time.new(2014, 05, 02, 18))
    expect(SendRoundupEmail.call(Time.new(2014, 05, 03, 7))).to be_nil
    expect(SendRoundupEmail.call(Time.new(2014, 05, 05, 7))).to_not be_nil
  end
end
