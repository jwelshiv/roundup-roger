Roundup Roger
=============

Roundup Roger is meant to replace a Standup or Scrum meeting. 

### How does Roundup Roger work?
Reminder emails are sent out everyday at the designated time.
Each team member responds to the reminder email with the tasks they completed that day. The following day, a roundup email is sent to the entire team with each member's contributions from the previous day.

### Setup
1. Ensure you have ruby version 2.1.1.
2. Run bundler.
  ```
  bundle install
  ```
3. Add a .env file to the application root (use .env.example as a starting point).

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

