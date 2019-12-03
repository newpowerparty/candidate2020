class Api::V1Controller < ApiController
	before_action :set_default
	private
	def set_default
		request.format = :json
		@options = {}
		@options[:include] = [:city, :images, :videos]

		@city_options = {}
		@city_options[:include] = [:candidates]
	end
end