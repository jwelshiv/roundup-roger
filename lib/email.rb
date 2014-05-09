class Email
  def self.create(attributes)
    emails = DB[:emails]
    emails.insert(new(attributes).attributes.select { |k, v| !v.nil? })
  end

  def self.db
    DB[:emails]
  end

  include Virtus.model

  attribute :id, Integer
  attribute :payload
  attribute :from_name, String
  attribute :from_email, String
  attribute :body, String
  attribute :created_at, Time, default: proc { Time.now }

  def self.last_24_hours(current_time=Time.now)
    self.db.where{created_at > (current_time - 3600 * 24)}.map { |attributes| new(attributes)}
  end
end
