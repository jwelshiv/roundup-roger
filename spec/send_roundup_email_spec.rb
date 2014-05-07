require 'roundup_roger'

describe SendRoundupEmail do
  it "works" do
    expect(SendOutboundEmail).to receive :call
    SendRoundupEmail.call
  end
end
