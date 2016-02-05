class API < Grape::API
	format :json
  content_type :txt, 'text/plain'
  get :hello do
    { hello: 'world' }
  end
end