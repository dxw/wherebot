require "sinatra/base"

module WhereBot
  class Web < Sinatra::Base
    get "/" do
      status 200
      body ""
    end
  end
end
