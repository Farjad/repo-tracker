class App < Sinatra::Application
	get '/' do
    content_type :json
    {'message':'invalid route'}.to_json
	end
end