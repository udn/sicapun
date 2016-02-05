require 'sinatra'

class Sicapun < Sinatra::Base
  get '/' do
    "Hello world! :X"
  end
end
