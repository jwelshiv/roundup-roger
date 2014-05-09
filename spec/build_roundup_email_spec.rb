require 'roundup_roger'

describe BuildRoundupEmail do
  let(:recipients) {"pcreux@gmail.com, cooper.jennl@gmail.com" }
  let(:outbound_email) { BuildRoundupEmail.call(recipients, Time.new(2014, 05, 02, 8)) }
  
  it "works" do
    outbound_email.should be_a OutboundEmail
  end

  it "should have the team members in the 'to'" do
    expect(outbound_email.to).to eq "pcreux@gmail.com, cooper.jennl@gmail.com"
  end

  it "should have the inbound emails from the day in the body" do
    Email.create(from_name: "Philippe Creux", from_email: "pcreux@gmail.com", body: "Hello!", created_at: Time.new(2014, 05, 01, 18))
    expect(outbound_email.body).to include "Hello!"
  end

  it "should have a subject" do
    expect(outbound_email.subject).to eq "Roundup for Friday, 2 May"
  end
end
