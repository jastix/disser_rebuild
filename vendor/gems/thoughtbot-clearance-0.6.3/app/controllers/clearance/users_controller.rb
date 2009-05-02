class Clearance::UsersController < ApplicationController
  unloadable

  before_filter :authenticate
  #before_filter :redirect_to_root, :only => [:new, :create], :if => :signed_in?
  filter_parameter_logging :password

def index
  @user = User.find(:all)
   render :template => 'users/index'
end

def edit
	@user = User.find(params[:id])
        render :template => 'users/edit'
end

def delete
	@user = User.find(params[:id])
	@user.destroy
	redirect_to users_path
end

def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		redirect_to users_path
	else
		render :action => :new
	end
end

  def new
    @user = ::User.new(params[:user])
    render :template => 'users/new'
  end

  def create
    @user = ::User.new params[:user]
    if @user.save
        @user.confirm_email!
      ##::ClearanceMailer.deliver_confirmation @user
      #flash[:notice] = "You will receive an email within the next few minutes. " <<
       #                "It contains instructions for confirming your account."
      redirect_to url_after_create
    else
      render :template => 'users/new'
    end
  end

  private

  def url_after_create
    new_session_url
  end

end

