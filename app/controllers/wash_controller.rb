class WashController < ApplicationController
	layout 'wash'

	def initialize
		super
		begin
			@wash_data = JSON.parse(File.read("/tmp/data.txt"))
		rescue
			@wash_data = Hash.new
		@wash_data.each do |key,obj|
			if Time.now.to_i - key.to_i > 24*60*60*100 then
				@wash_data.delete(key)
			end
		end
		File.write("/tmp/data.txt", @wash_data.to_json)
	end

	def index
		if request.post? then
			obj = MyData.new(name:params['name'])
			@wash_data[Time.now.to_i] = obj
			data = @wash_data.to_json
			File.write("/tmp/data.txt", data)
			@wash_data = JSON.parse(data)
		end
		@wash_count = @wash_data.length.to_s
	end
end

class MyData
	attr_accessor :name

	def initialize name:name
		self.name = name
	end
end
end