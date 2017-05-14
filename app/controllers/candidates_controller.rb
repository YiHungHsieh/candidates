# rails g model VoteLog ip_address candidate_id:integer
# rails g model VoteLog ip_address candidate:references

class CandidatesController < ApplicationController

	# before_action :find_candidate, only: [:show, :edit, :update, :destroy]

	def index
		@candidates = Candidate.all  #慣例上會給複數
	end	

	def show
		@candidate = Candidate.find_by(id:params[:id])
		redirect_to candidates_path if @candidate.nil?
		# @candidate = Candidate.find(params[:id])
	end

	def edit
		@candidate = Candidate.find_by(id:params[:id])
		redirect_to candidates_path if @candidate.nil?
	end

	def update
		@candidate = Candidate.find_by(id:params[:id])
			flash[:notice]= "done update"
		redirect_to candidates_path if @candidate.nil?
		if @candidate.update(candidate_params)
			redirect_to candidates_path
		else
			render "edit"
		end
	end

	def destroy
		@candidate = Candidate.find_by(id:params[:id])
		redirect_to candidates_path if @candidate.nil?
		
		@candidate.destroy
		redirect_to candidate_path
	end

	def vote
	  # log = VoteLog.new(ip_address: request.remote_ip, candidate: @candidate)
	  # log.save
	  @candidate = Candidate.find_by(id:params[:id])
	  @candidate.vote_logs.create(ip_address: request.remote_ip)
      @candidate.increment(:votes)
      @candidate.save
      redirect_to candidates_path, notice: "完成投票!"
    end

	def new
		@candidate = Candidate.new
	end

	def create
		@candidate = Candidate.new(candidate_params)
		if @candidate.save
			redirect_to candidates_path
		else
			render :new
			# redirect_to new_candidate_path? name=""&party=".."
			#....
		end

	end	

	private
	def candidate_params
		params.require(:candidate).permit(:name, :party, :age, :politics)
	end
end


