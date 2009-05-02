class DisserPdfsController < ApplicationController
before_filter :authenticate

  def index
    @disser_pdfs = DisserPdf.all
  end

  def show
    @disser_pdf = DisserPdf.find(params[:id])
  end

  def new
    @disser_pdf = DisserPdf.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @disser_pdf = DisserPdf.new(params[:disser_pdf])
    respond_to do |wants|
      if @disser_pdf.save
        wants.html do
          flash[:notice] = "Successfully created disser pdf."
          redirect_to @disser_pdf
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @disser_pdf = DisserPdf.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @disser_pdf = DisserPdf.find(params[:id])
    respond_to do |wants|
      if @disser_pdf.update_attributes(params[:disser_pdf])
        wants.html do
          flash[:notice] = "Successfully updated disser pdf."
          redirect_to @disser_pdf
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @disser_pdf = DisserPdf.find(params[:id])
    @disser_pdf.destroy
    flash[:notice] = "Successfully removed disser pdf."
    redirect_to disser_pdfs_url
  end
end

