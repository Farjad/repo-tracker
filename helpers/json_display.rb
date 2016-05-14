module JsonDisplay
	def json_display(sequel_data)
		if sequel_data.is_a?(Array)
			output = sequel_data.map { |row| row.to_hash }
		elsif !sequel_data.nil? && !sequel_data.is_a?(Numeric) && !sequel_data.is_a?(Hash)
			output = sequel_data.to_hash
		elsif sequel_data == 400
			status 400
			output = {'status':400, 'message':'invalid json'}
		elsif sequel_data.is_a?(Hash) && sequel_data.any?
			output = sequel_data
		else
			status 404
			output = {'status':404, 'message':'invalid endpoint'}
		end
		output.to_json
	end
	module_function :json_display
end
