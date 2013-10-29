class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :studying]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
      @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
#    respond_to do |format|
#     format.html # show.html.erb
#      format.json { render json: @piece }
#    end
  end

  def new
    if signed_in?
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    if signed_in?
      redirect_to root_path
    else
      @user = User.new(params[:user])
      if @user.save
    	 sign_in @user
    	 flash[:success] = "Welcome to Rhymember"
    	 redirect_to @user
      else
        render 'new'
      end
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    if (current_user == user)  && (current_user.admin?)
      flash[:error] = "Can not delete own admin account!"
    else
      user.destroy
      flash[:success] = "User destroyed."
    end
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def studying
    @title = "Studying"
    @user = User.find(params[:id])
    @pieces = @user.studies.paginate(page: params[:page])
    render 'show_studies'
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
end
