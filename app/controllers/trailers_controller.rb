class TrailersController < InheritedResources::Base

  def new
    @trailer_lead = Trailer.new
  end

  def create
    @trailer_lead = CreateTrailer.new(params).call if verify_captcha?

    if verify_captcha? && @trailer_lead&.valid?
      redirect_to new_trailer_lead_path, notice: 'Your request has been submitted successfully.'
    else
      render :handle_error, status: :unprocessable_entity
    end
  end







  private

    def trailer_params
      params.require(:trailer).permit()
    end

end
