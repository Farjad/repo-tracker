class App < Sinatra::Application
	get '/' do
    content_type :json
    json_display 404
	end
end