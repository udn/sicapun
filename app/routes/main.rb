class Web < Sinatra::Base
  # include Mongo

  YAML::load(File.open('config/database.yml'))[$env].symbolize_keys.each do |key, value|
    set key, value
  end

  configure do

    ActiveRecord::Base.establish_connection(
     :adapter  => 'postgresql',
     :host     => settings.host,
     :username => settings.username,
     :password => settings.password,
     :database => settings.database,
     :encoding => 'utf8'
    )
  end

  enable :sessions

  get '/' do
    "Qontak API Version 1.0. Last Update 5th Feb 2016. -Team"
  end
end