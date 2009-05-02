class DisserDocsController < ApplicationController
before_filter :authenticate

  def index
    @disser_docs = DisserDoc.all
  end

  def show
    @disser_doc = DisserDoc.find(params[:id])
  end

  def new
    @disser_doc = DisserDoc.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @disser_doc = DisserDoc.new(params[:disser_doc])
    respond_to do |wants|
      if @disser_doc.save
        wants.html do
          flash[:notice] = "Successfully created disser doc."
          redirect_to @disser_doc
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @disser_doc = DisserDoc.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @disser_doc = DisserDoc.find(params[:id])
    respond_to do |wants|
      if @disser_doc.update_attributes(params[:disser_doc])
        wants.html do
          flash[:notice] = "Successfully updated disser doc."
          redirect_to @disser_doc
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @disser_doc = DisserDoc.find(params[:id])
    @disser_doc.destroy
    flash[:notice] = "Successfully removed disser doc."
    redirect_to disser_docs_url
  end
end

