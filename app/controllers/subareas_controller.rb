class SubareasController < ApplicationController
before_filter :authenticate

  def index
    @subareas = Subarea.all
  end

  def new
    @subarea = Subarea.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @subarea = Subarea.new(params[:subarea])
    respond_to do |wants|
      if @subarea.save
        wants.html do
          flash[:notice] = "Successfully created subarea."
          redirect_to subareas_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @subarea = Subarea.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @subarea = Subarea.find(params[:id])
    respond_to do |wants|
      if @subarea.update_attributes(params[:subarea])
        wants.html do
          flash[:notice] = "Successfully updated subarea."
          redirect_to subareas_url
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @subarea = Subarea.find(params[:id])
    @subarea.destroy
    flash[:notice] = "Successfully removed subarea."
    redirect_to subareas_url
  end
end

