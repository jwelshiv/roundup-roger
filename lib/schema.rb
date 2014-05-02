require 'sequel'

DB = Sequel.sqlite # memory database

DB.create_table :emails do
  primary_key :id
  String :payload
  String :from_email
  String :from_name
  String :body
  Time :created_at
end
