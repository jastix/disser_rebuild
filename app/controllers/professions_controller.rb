class ProfessionsController < ApplicationController
before_filter :authenticate

  def index

    @professions = Profession.all
  end

  def new

    @profession = Profession.new

    respond_to do |wants|
      wants.html

    end

  end

  def create
    @profession = Profession.new(params[:profession])
    respond_to do |wants|
      if @profession.save
        wants.html do
          flash[:notice] = "Специальность добавлена."
          redirect_to professions_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit

    @profession = Profession.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @profession = Profession.find(params[:id])
    respond_to do |wants|
      if @profession.update_attributes(params[:profession])
        wants.html do
          flash[:notice] = "Данные записаны."
          redirect_to professions_url
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy
    flash[:notice] = "Специальность удалена."
    redirect_to professions_url
  end
end

