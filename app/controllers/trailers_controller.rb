class TrailersController < InheritedResources::Base

def index
@trailer_leads = Flavor.all
end

def show
end


def new
  @trailer_lead = Trailer.new
end

def edit
end


def create
  @trailer_lead = Trailer.new(trailer_params)


    respond_to do |format|
      if @trailer_lead.save
        format.html { redirect_to @trailer_lead, notice: 'Thank You.  Your inquiry was successfully submit.' }
        format.json { render :show, status: :created, location: @trailer_lead }
      else
        format.html { render :new }
        format.json { render json: @trailer_lead.errors, status: :unprocessable_entity }
      end
end
end

  def update
    respond_to do |format|
      if @trailer_lead.update(trailer_params)
        format.html { redirect_to @trailer_lead, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_lead }
      else
        format.html { render :edit }
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
end
















  private

    def trailer_params
      params.require(:trailer).permit(:firstname, :lastname, :detail, :email, :phone, :date, :address1, :city, :state, :zip, :eventstart)
    end

    def verify_captcha?
    @recaptcha_result = true if params[:recaptcha_result] == 'verified'
    return @recaptcha_result if @recaptcha_result

    @recaptcha_result = verify_recaptcha action: 'contact_form', minimum_score: 0.7, secret_key: Rails.application.credentials.recaptcha_secret_key_v3
  end

