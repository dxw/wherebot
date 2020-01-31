class Sickness < SlackRubyBot::Commands::Base
  match Regexp.new("^sick", Regexp::IGNORECASE) do |client, data|
    client.web_client.reactions_add(
      name: :grapes,
      channel: data.channel,
      timestamp: data.ts,
      as_user: true
    )
  end
end
