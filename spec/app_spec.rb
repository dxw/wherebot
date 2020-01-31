require "spec_helper"

describe WhereBot::Bot do
  let(:app) { SlackRubyBot::Server.new }
  let(:client) { app.send(:client) }
  let(:message_hook) { SlackRubyBot::Hooks::Message.new }
  let(:timestamp) { 1234556 }
  let(:channel) { "channel" }

  context "when user is sick" do
    before do
      expect(client).to receive_message_chain(:web_client, :reactions_add).with(
        name: :grapes,
        channel: channel,
        timestamp: timestamp,
        as_user: true
      )
    end

    it "reacts when a user does not use capitalisation" do
      message_hook.call(
        client,
        Hashie::Mash.new(text: "sick - off", channel: channel, ts: timestamp)
      )
    end

    it "reacts when a user uses capitalisation" do
      message_hook.call(
        client,
        Hashie::Mash.new(text: "Sick - not feeling very well", channel: channel, ts: timestamp)
      )
    end
  end
end
