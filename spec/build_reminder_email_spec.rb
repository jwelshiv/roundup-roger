require 'roundup_roger'

describe BuildReminderEmail do
  let(:team_member) { {"Philippe Creux" => "pcreux@gmail.com"} }
  let(:outbound_email) { BuildReminderEmail.call(team_member, Time.new(2014, 05, 02, 8)) }
  
  it "works" do
    outbound_email.should be_a OutboundEmail
  end

  it "should have the team member in the 'to'" do
    expect(outbound_email.to).to eq [ 
      "Philippe Creux <pcreux@gmail.com>"
    ]
  end

  it "should have a subject" do
    expect(outbound_email.subject).to eq "Standup Reminder for Friday, 2 May"
  end

  it "should have a body" do
    expect(outbound_email.body).to eq "What did you do today?"
  end
end
