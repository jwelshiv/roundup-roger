class OutboundEmail
  include Virtus.model

  attribute :to, Array[String]
  attribute :subject, String
  attribute :body, String
end
