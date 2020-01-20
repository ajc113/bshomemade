class BeesController < ApplicationController
  before_action :set_bee, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /bees
  # GET /bees.json
  def index
  @bees = Bee.all
  @flavor = Flavor.where(flavorofweek:["Yes"]).last
  @lead = Lead.new
  set_meta_tags title: "Home",
              site: "B's Ice Cream",
              reverse: true,
              description: "B's Ice Cream serving the best homemade ice cream on the south shore. Come visit our shop in Marshfield, MA for the best homemade ice cream near you.",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 
  end

  def cards
  set_meta_tags title: "Gift Cards",
              site: "B's Ice Cream",
              reverse: true,
              description: "Give the gift of ice cream.  Purchase gift cards online and we will mail them to you. Available in multiple denominations.",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 

  end

  def event
  set_meta_tags title: "Events",
              site: "B's Ice Cream",
              reverse: true,
              description: "Host your next event at B's Ice Cream.  If you're having a party, whether it's a Birthday, Retirement, Anniversary, etc, come celebrate at B’s Ice Cream.",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 

  end

  def merch
  set_meta_tags title: "Merch",
              site: "B's Ice Cream",
              reverse: true,
              description: "Get in Style with B's Ice Cream Merch.  T-Shirts, longsleeve, sweatshirts, and all things B's Ice Cream.",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 

  end

  # GET /bees/1
  # GET /bees/1.json
  def show
  end

  def about
  set_meta_tags title: "About",
              site: "B's Ice Cream",
              reverse: true,
              description: "Family owned ice cream shop making all homemade flavors on site daily",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 

  end

  # GET /bees/new
  def new
    @bee = Bee.new
  end

  # GET /bees/1/edit
  def edit
  end

  # POST /bees
  # POST /bees.json
  def create
    @bee = Bee.new(bee_params)

    respond_to do |format|
      if @bee.save
        format.html { redirect_to @bee, notice: 'Bee was successfully created.' }
        format.json { render :show, status: :created, location: @bee }
      else
        format.html { render :new }
        format.json { render json: @bee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bees/1
  # PATCH/PUT /bees/1.json
  def update
    respond_to do |format|
      if @bee.update(bee_params)
        format.html { redirect_to @bee, notice: 'Bee was successfully updated.' }
        format.json { render :show, status: :ok, location: @bee }
      else
        format.html { render :edit }
        format.json { render json: @bee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bees/1
  # DELETE /bees/1.json
  def destroy
    @bee.destroy
    respond_to do |format|
      format.html { redirect_to bees_url, notice: 'Bee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bee
      @bee = Bee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bee_params
      params.fetch(:bee, {})
    end

end
