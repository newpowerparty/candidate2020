class Api::V1::CandidatesController < Api::V1Controller
	def index
		@candidates = Candidate.order(:city_id)
		render json: CandidateSerializer.new(@candidates, @options).serialized_json
	end
	def show
		@candidate = Candidate.find(params[:id])
		if @candidate.present?
			render json: CandidateSerializer.new(@candidate, @options).serialized_json
		else
			render json: "404"
		end
	end
end