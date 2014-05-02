ENV['RACK_ENV'] = 'test'
require 'web'
require 'rack/test'

describe "roundup-roger web app" do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  let(:payload_json) { File.read 'spec/support/payload.json' }

  it "works" do
    DB[:emails].delete
    post '/', :mandrill_events => payload_json
    expect(last_response.status).to eq 200
    expect(DB[:emails].first).to_not be_nil
  end

end
