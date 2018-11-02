class UsersController < ApplicationController

  def index
  @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Bee was successfully created.' }
        format.json { render :show, status: :created, location: @bee }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  def user_params
    params.require(:user).permit(:email, :fname, :lname)
  end

end