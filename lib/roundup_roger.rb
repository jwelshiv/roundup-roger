require 'bundler'
Bundler.require

Dotenv.load
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'process_payload'
require 'schema'
require 'email'
require 'build_roundup_email'
require 'outbound_email'
require 'send_outbound_email'
require 'send_roundup_email'
require 'send_reminder_emails'
require 'build_reminder_email'
