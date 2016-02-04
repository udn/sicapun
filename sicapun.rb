# sincapun.rb
require 'sinatra'

class Sincapun < Sinatra::Base
  get '/' do
    "Hello world"
  end
end

# config.ru
require './sincapun'
run Sincapun
