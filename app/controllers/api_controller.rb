class ApiController < ApplicationController
	layout false
	def index
		@candidates = Candidate.all
		@cities = Location.all
		@demo_candidates = CandidateSerializer.new(@candidates.first).serialized_json
		@id_tables = JSON.pretty_generate(JSON.parse(@candidates.select(:id, :name).reorder(:id).to_json))

		@demo_cities = CitySerializer.new(@cities.first).serialized_json
		@city_id_tables = JSON.pretty_generate(JSON.parse(@cities.select(:id, :name).reorder(:id).to_json))
	end
end