require_relative 'lib/roundup_roger'

task :console do
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end

task :email do
  body = "<h4>Hello</h4>"
  response = SendOutboundEmail.call OutboundEmail.new(to: ["cooper.jennl@gmail.com"], subject: "Moo!", body: body)
  puts response
end

task :send_roundup do
  SendRoundupEmail.call
end

task :send_reminders do
  SendReminderEmails.call
end
