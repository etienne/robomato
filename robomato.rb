require 'slackbotsy'
require 'sinatra'

config = {
  'team'           => 'ouvrage',
  'channel'        => '#tomates',
  'name'           => 'robomato',
  'incoming_token' => ENV['token'],
  'outgoing_token' => ENV['token']
}

bot = Slackbotsy::Bot.new(config) do

  hear /tomate(([^\d]+)(\d+)(.+)mins?)?/ do |data, mdata|
    if mdata[3].to_i > 0
      duration = mdata[3]
    else
      duration = 25
    end
    "Je suis un robot idiot, mais je pense que tu veux une tomate de #{duration} minutes."
  end

end

post '/' do
  bot.handle_item(params)
end