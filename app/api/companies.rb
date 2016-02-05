class API < Grape::API
	format :json
  content_type :txt, 'text/json'

  get :hello do
    # { hello: 'world' }
    Company.all.to_json
  end

  version '1.0', using: :header, vendor: 'qontak'

  resource :companies do
  	desc 'Return a status.'
    params do
      requires :id, type: Integer, desc: 'Company id.'
    end
    route_param :id do
      get do
        Company.find(params[:id])
      end
    end
  end

end