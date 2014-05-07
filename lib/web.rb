require_relative 'roundup_roger'

get '/' do
  "Hello!"
end

post '/' do
  begin
    ProcessPayload.call(JSON.parse params[:mandrill_events])
  rescue => e
    puts e.inspect
    raise e
  end

  ""
end
