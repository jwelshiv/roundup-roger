require_relative 'lib/roundup_roger'

task :console do
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end

task :send_test_email do
  body = "<h2>Hello!</h2>This is a test email."
  response = SendOutboundEmail.call OutboundEmail.new(to: [ENV['EMAIL_TO']], subject: "Test!", body: body)
  puts response
end

task :send_roundup do
  SendRoundupEmail.call
end

task :send_reminders do
  SendReminderEmails.call
end
