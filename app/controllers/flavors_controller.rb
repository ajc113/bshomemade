class FlavorsController < ApplicationController
  before_action :set_flavor, only: [:show, :edit, :update, :destroy]

  # GET /flavors
  # GET /flavors.json
  def index
    @flavors = Flavor.where(instock:["Yes"]).order('name ASC')
    @outstock = Flavor.where(instock:["No"]).order('name ASC')
    set_meta_tags title: "Flavors",
              site: "B's Ice Cream",
              reverse: true,
              description: "Check out our unique homemade flavors made right in our shop",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 
  end

  # GET /flavors/1
  # GET /flavors/1.json
  def show
  end

  # GET /flavors/new
  def new
    @flavor = Flavor.new
  end

  # GET /flavors/1/edit
  def edit
  end

  # POST /flavors
  # POST /flavors.json
  def create
    @flavor = Flavor.new(flavor_params)

    respond_to do |format|
      if @flavor.save
        format.html { redirect_to @flavor, notice: 'Flavor was successfully created.' }
        format.json { render :show, status: :created, location: @flavor }
      else
        format.html { render :new }
        format.json { render json: @flavor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flavors/1
  # PATCH/PUT /flavors/1.json
  def update
    respond_to do |format|
      if @flavor.update(flavor_params)
        format.html { redirect_to @flavor, notice: 'Flavor was successfully updated.' }
        format.json { render :show, status: :ok, location: @flavor }
      else
        format.html { render :edit }
        format.json { render json: @flavor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flavors/1
  # DELETE /flavors/1.json
  def destroy
    @flavor.destroy
    respond_to do |format|
      format.html { redirect_to flavors_url, notice: 'Flavor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flavor
      @flavor = Flavor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flavor_params
      params.require(:flavor).permit(:name, :description, :availability, :flavorofweek, :image, :created_at, :instock)
    end
end
