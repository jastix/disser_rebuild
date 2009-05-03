class OrganizationsController < ApplicationController
before_filter :authenticate

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @organization = Organization.new(params[:organization])
    respond_to do |wants|
      if @organization.save
        wants.html do
          flash[:notice] = "Организация добавлена."
          redirect_to organizations_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @organization = Organization.find(params[:id])
    respond_to do |wants|
      if @organization.update_attributes(params[:organization])
        wants.html do
          flash[:notice] = "Организация сохранена."
          redirect_to organizations_url
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    flash[:notice] = "Организация удалена."
    redirect_to organizations_url
  end
end

