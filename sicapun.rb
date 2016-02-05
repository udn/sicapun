require 'sinatra'

class Sicapun < Sinatra::Base
  get '/' do
    "Hello world! :D"
  end
end
