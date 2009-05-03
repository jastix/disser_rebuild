class AreasController < ApplicationController
before_filter :authenticate

  def index
    @areas = Area.all
  end

  def new
    @area = Area.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @area = Area.new(params[:area])
    respond_to do |wants|
      if @area.save
        wants.html do
          flash[:notice] = "Область добавлена."
          redirect_to areas_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @area = Area.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @area = Area.find(params[:id])
    respond_to do |wants|
      if @area.update_attributes(params[:area])
        wants.html do
          flash[:notice] = "Данные сохранены."
          redirect_to areas_url
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    flash[:notice] = "Область удалена."
    redirect_to areas_url
  end
end

