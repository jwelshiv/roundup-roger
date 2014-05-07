require 'json'

class ProcessPayload
  def self.call(payload)
    payload.map do |email_payload|
      new(email_payload).call
    end
  end

  def initialize(payload)
    @payload = payload
  end

  attr_reader :payload

  def call
    Email.create(:payload => JSON.encode(payload), :from_name => from_name, :from_email => from_email, :body => body)
  end

  private
  
  def from_name
    payload['msg']['from_name']
  end

  def from_email
    payload['msg']['from_email']
  end

  def body
    payload['msg']['text'].split("\n-- \n")[0]
  end
end
