class LeadsController < ApplicationController

	def create
		@lead = Lead.new(lead_params)
		if @lead.save
			redirect_to root_path, notice: "Saved succesfully!"
		else
		  redirect_to root_path, notice: "Failed to save!" 	
	end
end

	private

	def lead_params
		params.require(:lead).permit(:fname, :lname, :email)
	end	
end


