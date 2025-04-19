class TrailersController < InheritedResources::Base
  include RecaptchaVerifiable

  def new
    @trailer_lead = Trailer.new
  end

  def edit
  end

  def create
    @trailer_lead = Trailer.new(trailer_params)

    respond_to do |format|
      if verify_recaptcha_v3(params[:recaptcha_token], 'trailer_inquiry')
        if @trailer_lead.save 
          format.turbo_stream
          format.html { redirect_to @trailer_lead, notice: 'Thank You. Your inquiry was successfully submitted.' }
          format.json { render :show, status: :created, location: @trailer_lead }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @trailer_lead.errors, status: :unprocessable_entity }
        end
      else
        flash.now[:alert] = "reCAPTCHA verification failed. Please try again."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { error: "reCAPTCHA verification failed" }, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trailer_lead.update(trailer_params)
        format.html { redirect_to @trailer_lead, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trailer_lead.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @trailer_lead.destroy
    respond_to do |format|
      format.html { redirect_to trailers_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def trailer_params
      params.require(:trailer).permit(:firstname, :lastname, :detail, :email, :phone, :date, :address1, :city, :state, :zip, :eventstart, :guest)
    end
end