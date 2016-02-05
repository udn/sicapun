class Web < Sinatra::Base
  # include Mongo

  # YAML::load(File.open('config/database.yml'))[$env].symbolize_keys.each do |key, value|
  #   set key, value
  # end

  # configure do
  #   $conn = MongoClient.new(settings.host, settings.port)
  #   $db = $conn.db(settings.database)
  #   set :db, $db
  # end

  enable :sessions
  # set :session_secret, "s5b49d8cb1871123b98d23b08c40c92d0"


  get '/' do
    "Hello world. !"
  end
end