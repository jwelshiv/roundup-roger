require 'roundup_roger'

describe SendRoundupEmail do
  it "sends when there are emails to roundup" do
    Email.create(body: "hi there")
    expect(SendOutboundEmail).to receive :call
    SendRoundupEmail.call(Time.new(2014, 05, 02, 7))
  end

  it "doesn't send when there are no emails in the last 24 hours" do
    DB[:emails].delete
    expect(SendRoundupEmail.call(Time.now)).to be_nil
  end

  it "doesn't send on Saturday" do
    DB[:emails].delete
    email = Email.create(body: "hi there", created_at: Time.new(2014, 05, 02, 18))

    expect(SendOutboundEmail).to_not receive :call
    SendRoundupEmail.call(Time.new(2014, 05, 03, 7))
  end

  it "does send on Monday" do
    DB[:emails].delete
    email = Email.create(body: "hi there", created_at: Time.new(2014, 05, 02, 18))

    expect(SendOutboundEmail).to receive :call
    SendRoundupEmail.call(Time.new(2014, 05, 05, 7))
  end
end
