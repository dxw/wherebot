$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "lib")

require "dotenv"
Dotenv.load

require "wherebot"

Thread.abort_on_exception = true

Thread.new do
  begin
    WhereBot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run WhereBot::Web
