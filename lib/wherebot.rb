require "slack-ruby-bot"
require "dotenv/load"

require "web"
require "commands/sickness"

module WhereBot
  class Bot < SlackRubyBot::Bot
  end
end
