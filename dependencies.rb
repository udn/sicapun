ENV['RACK_ENV'] ||= 'development'

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'sinatra/activerecord'

%w(
grape
sinatra
).each do |dep|
  require dep
end

$env = ENV['RACK_ENV']