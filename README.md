![roundup roger logo](https://dl.dropboxusercontent.com/u/79436/roundup_roger_logo1.png "Roundup Roger's new digs!")

=============

Roundup Roger helps teams perform a wrap up at the end of day. Great for teams working remotely or those that just finish at a different time.


1. Roundup Roger sends emails to your team members everyday at a designated time.
2. Each team member responds to the reminder email with the tasks they completed that day.
3. The following day, a roundup email is sent to the entire team with each member's contributions from the previous day.

Read more on our [introduction blog post](http://brewhouse.io/2014/06/27/say-hello-to-roundup-roger.html).

### Requirements

This is a Ruby [Sinatra](http://www.sinatrarb.com/) application that processes the incoming mail from [Mandrill](https://www.mandrill.com) and has rake tasks to send out the emails to your team.

- SMTP Server to send the email of course (Can use Mandrill here too)
- Incoming [Mandrill](http://help.mandrill.com/entries/21699367-Inbound-Email-Processing-Overview) email address to collect the responses
- Machine to run this, works perfectly on [Heroku](heroku.com).
- A [PostgresSQL](http://www.postgresql.org/) database

### Setup
1. Ensure you have ruby version 2.1.1.
2. Run bundler.
  ```
  bundle install
  ```
3. Add a .env file to the application root (use .env.example as a starting point).

In `.env` you can set up the email addresses of your team, the SMTP server settings and other config for the application.

### Rake Tasks
To send a test email
  ```
  rake send_test_email
  ```
To send reminder emails
  ```
  rake send_reminders
  ```
To send roundup email
  ```
  rake send_roundup
  ```

These rake tasks work perfect with [Heroku's scheduler](https://addons.heroku.com/scheduler).
