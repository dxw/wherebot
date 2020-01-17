require "slack-ruby-bot"

require "dotenv/load"

class WhereBot < SlackRubyBot::Bot
  command "ping" do |client, data, match|
    client.say(text: "pong", channel: data.channel)
  end

  match /sick (?<type>\w*)/ do |client, data, match|
    client.say(channel: data.channel, text: "You're sick and #{match[:type]}? Have some 🍇")
  end
end

WhereBot.run
