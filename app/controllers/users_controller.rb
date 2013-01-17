class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy] #check to see if there is a user signed in.  Signed in users only allow to see all, and edit themselves
  before_filter :correct_user, only: [:edit, :update] #check to see if @current_user is user found via params[:id]
  before_filter :admin_user, only: :destroy
  before_filter :new_user, only: [:new, :create] #signed in user will not have to see the sign up form

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user #new sign ups are automatically logged in
      # UserMailer.registration_confirmation(@user).deliver
      #flash[:success] = "Welcome to HB Communicator!" #assign the :success symbol to that message
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user]) #VALIDATIONS comes in here when attempting to save, resulting in error messages
      #flash[:success] = "Profie updated."
      sign_in @user #the rememeber_token gets reset when user is saved
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    if User.find(params[:id]) != current_user
      User.find(params[:id]).delete
      #flash[:success] = "User deleted."
    else
      #flash[:notice] = "Cannot delete self."
    end
    redirect_to users_url
  end

  #---------------- Private Methods ----------------#

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def new_user
    redirect_to(current_user) unless current_user.nil?
  end

end
