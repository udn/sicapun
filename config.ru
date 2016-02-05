require './main'

use Rack::Session::Cookie, :key => 'rack.session',
                           :domain => 'api.qontak.com',
                           :path => '/',
                           :expire_after => 2592000,
                           :secret => 'LKJSky1849osid1kjo3ijljsashdho3kjansnasdsal41rdjlkasdl41rasn',
                           :old_secret => 'LKJSky1849osid1kjo3ijljsashdho3kjansnasdsal41rdjlkasdl41rasasdasdn'
run Rack::Cascade.new [API, Web]