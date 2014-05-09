class OutboundEmail
  include Virtus.model

  attribute :to, String
  attribute :subject, String
  attribute :body, String
end
