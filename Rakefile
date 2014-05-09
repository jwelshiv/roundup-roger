require_relative 'lib/roundup_roger'

task :console do
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end

task :email do
  SendOutboundEmail.call OutboundEmail.new(to: ["pcreux@gmail.com"], subject: "Moo!", body: "Hello!")
end

task :send_roundup do
  SendRoundupEmail.call
end

task :send_reminders do
  SendReminderEmails.call
end
