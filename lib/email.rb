class Email
  include Virtus.model

  attribute :id, Integer
  attribute :payload
  attribute :from, String
  attribute :body, String
end

env.mapping do
  emails do
    map :id, :payload, :from, :body
    model Email
  end
end
