class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new
  	@user.first_name = params[:first_name]
  	@user.last_name = params[:last_name]
  	@user.email_address = params[:email_address]
  	@user.password = params[:password]

  	if @user.save
  		redirect_to '/'
  	else
  		flash[:registration_errors] = @user.errors.full_messages
  		redirect_to '/users/new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	User.find(params[:id]).update(first_name:params[:first_name],last_name:params[:last_name],email_address:params[:email_address],password:params[:password])
  	redirect_to '/'
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	redirect_to '/'
  end
end
