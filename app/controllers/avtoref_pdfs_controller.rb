class AvtorefPdfsController < ApplicationController
before_filter :authenticate

  def index
    @avtoref_pdfs = AvtorefPdf.all
  end

  def show
    @avtoref_pdf = AvtorefPdf.find(params[:id])
  end

  def new
    @avtoref_pdf = AvtorefPdf.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @avtoref_pdf = AvtorefPdf.new(params[:avtoref_pdf])
    respond_to do |wants|
      if @avtoref_pdf.save
        wants.html do
          flash[:notice] = "Successfully created avtoref pdf."
          redirect_to @avtoref_pdf
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @avtoref_pdf = AvtorefPdf.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @avtoref_pdf = AvtorefPdf.find(params[:id])
    respond_to do |wants|
      if @avtoref_pdf.update_attributes(params[:avtoref_pdf])
        wants.html do
          flash[:notice] = "Successfully updated avtoref pdf."
          redirect_to @avtoref_pdf
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @avtoref_pdf = AvtorefPdf.find(params[:id])
    @avtoref_pdf.destroy
    flash[:notice] = "Successfully removed avtoref pdf."
    redirect_to avtoref_pdfs_url
  end
end

