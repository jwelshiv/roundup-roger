class Email
  PATTERNS = ['—\n+Sent', '--', '>? ?On'].freeze

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
    self.db.where{created_at > (current_time - 3600 * 24)}.map { |attributes| new(attributes) }
  end

  def self.last_business_day(current_time=Time.now)
    self.db.where{created_at > 1.business_day.before(current_time)}.map { |attributes| new(attributes) }
  end

  def self.is_business_day?(current_time=Time.now)
    not (current_time.saturday? || current_time.sunday?)
  end

  def stripped_body
    PATTERNS.each do |pattern|
      self.body = strip_pattern(pattern)
    end
    body.strip
  end

  def strip_pattern(pattern)
    body.gsub(/\n(#{pattern}| [^\n]+\n?[^\n]+\n+\>).*/m, "")
  end
end
