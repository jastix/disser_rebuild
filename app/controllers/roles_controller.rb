class RolesController < ApplicationController
before_filter :authenticate
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @role = Role.new(params[:role])
    respond_to do |wants|
      if @role.save
        wants.html do
          flash[:notice] = "Successfully created role."
          redirect_to @role
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @role = Role.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @role = Role.find(params[:id])
    respond_to do |wants|
      if @role.update_attributes(params[:role])
        wants.html do
          flash[:notice] = "Successfully updated role."
          redirect_to @role
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Successfully removed role."
    redirect_to roles_url
  end
end

