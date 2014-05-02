require 'json'
require 'rounduproger'

describe ProcessPayload do
  it "should store the payload" do
    payload_json = File.read 'spec/support/payload.json'
    ProcessPayload.call(JSON.parse payload_json)
    email = env[:emails].one
    expect(email).to_not be_nil
  end
end
