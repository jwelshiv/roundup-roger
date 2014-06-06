require 'roundup_roger'

describe BuildReminderEmail do
  let(:recipient) { "pcreux@gmail.com" }
  let(:outbound_email) { BuildReminderEmail.call(recipient, Time.new(2014, 05, 02, 8)) }
  
  it "works" do
    outbound_email.should be_a OutboundEmail
  end

  it "should have the team member in the 'to'" do
    expect(outbound_email.to).to eq "pcreux@gmail.com"
  end

  it "should have a subject" do
    expect(outbound_email.subject).to eq "What did you do today? Standup Reminder for Friday, 2 May"
  end

  it "should have an empty body" do
    expect(outbound_email.body).to eq ""
  end
end
