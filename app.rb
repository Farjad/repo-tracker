# encoding: utf-8
require 'sinatra'

class App < Sinatra::Application
	helpers do
		include Rack::Utils
	end
end

require_relative 'helpers/init'
require_relative 'models/init'
require_relative 'controllers/init'