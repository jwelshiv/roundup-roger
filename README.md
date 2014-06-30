![roundup roger logo](https://dl.dropboxusercontent.com/u/79436/roundup_roger_logo1.png "Roundup Roger's new digs!")

=============

Roundup Roger helps teams with end of day wrap-ups. Great for teams working remotely and those who finish working at different times.

1. Roundup Roger sends an email to your team members every day at a designated time.
2. Each team member responds to the reminder email with what they worked on that day.
3. The following morning, a roundup email is sent to the entire team with each member's contributions from the previous day.

Read more on our [introduction blog post](http://brewhouse.io/2014/06/27/say-hello-to-roundup-roger.html).

### Requirements

This is a Ruby [Sinatra](http://www.sinatrarb.com/) app that processes the incoming mail using [Mandrill](https://www.mandrill.com) and has a rake task to send out emails to your team.

1. SMTP server for outgoing email (Can use Mandrill here, too)
2. Incoming [Mandrill](http://help.mandrill.com/entries/21699367-Inbound-Email-Processing-Overview) email address to collect the responses
3. Server to run this, works perfectly on [Heroku](heroku.com)
4. A [PostgreSQL](http://www.postgresql.org/) database

### Setup
1. Ensure you have ruby version 2.1.1.
2. Run bundler.
  ```
  bundle install
  ```
3. Add a .env file to the application root (use .env.example as a starting point).

In `.env` you can set up the email addresses of your team, the SMTP server settings and other config for the app.

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

These rake tasks work perfect with [Heroku's scheduler](https://addons.heroku.com/scheduler), or you could use [whenever](https://github.com/javan/whenever) or simple cron to run the tasks.
