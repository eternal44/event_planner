class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      redirect_to signin_path, notice: 'User was successfully created.'
    else
      # render :text => "here"
      render action: "new"
    end
  end

  def show
  	@user = User.find(params[:id])
    #@comments = @user.comments.order("id ASC")
  end

  def index
    @users = User.all
  end
end
