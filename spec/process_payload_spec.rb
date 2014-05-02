require 'json'
require 'roundup_roger'

describe ProcessPayload do
  let(:payload_json) { File.read 'spec/support/payload.json' }

  before do
    ProcessPayload.call(JSON.parse(payload_json))
  end

  it "should store the payload" do
    expect(DB[:emails].first).to_not be_nil
  end

  describe "persisted email" do
    let(:email) { Email.new DB[:emails].first }
    subject { email }

    its(:from_name)  { "Philippe Creux" }
    its(:from_email) { "pcreux@gmail.com" }
    its(:body)       { "And here is some content!" }
  end
end
