class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.page(params[:page]).order('created_at DESC')
    set_meta_tags title: "Updates",
              site: "B's Ice Cream",
              reverse: true,
              description: "Get the latest news at B's Ice Cream.  Stay up to date with new flavors, events, and promotions.",
              keywords: "best ice cream, homemade ice cream, ice cream, ice cream near me, south shore ice cream, ice cream places near me, ice cream shop, ice cream shops near me, best ice cream near me, ice cream nearby, homemade ice cream near me, ice cream parlour, ice cream stores near me, ice cream parlour near me, creamery near me, the ice cream shop, ice cream around me, nearest ice cream shop, homemade vanilla ice cream, nearest ice cream place, good ice cream near me, closest ice cream, cream ice cream, places to get ice cream near me, ice cream company, best ice cream places near me" 
  end

  # GET /posts/1  
  # GET /posts/1.json
  def show
   @post = Post.friendly.find(params[:id])
   @posts = Post.all.page(params[:page])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :slug, :image, :meta_title, :meta_description, :meta_keywords)
    end
end
