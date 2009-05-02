class GradesController < ApplicationController
before_filter :authenticate

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @grade = Grade.new(params[:grade])
    respond_to do |wants|
      if @grade.save
        wants.html do
          flash[:notice] = "Successfully created grade."
          redirect_to grades_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @grade = Grade.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @grade = Grade.find(params[:id])
    respond_to do |wants|
      if @grade.update_attributes(params[:grade])
        wants.html do
          flash[:notice] = "Successfully updated grade."
          redirect_to grades_url
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    flash[:notice] = "Successfully removed grade."
    redirect_to grades_url
  end
end

