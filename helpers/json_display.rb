module JsonDisplay
	def json_display(sequel_data)
		output = {'status':404, 'message':'invalid endpoint'} if sequel_data.nil?
		if sequel_data.is_a?(Array)
			output = sequel_data.map { |row| row.to_hash }
		elsif !sequel_data.nil?
			output = sequel_data.to_hash
		end
		output.to_json
	end
	module_function :json_display
end
