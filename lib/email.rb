class Email
  include Virtus.model

  attribute :id, Integer
  attribute :payload
  attribute :from_name, String
  attribute :from_email, String
  attribute :body, String
end
