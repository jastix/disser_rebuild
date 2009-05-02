class AvtorefDocsController < ApplicationController
before_filter :authenticate

  def index
    @avtoref_docs = AvtorefDoc.all
  end

  def show
    @avtoref_doc = AvtorefDoc.find(params[:id])
  end

  def new
    @avtoref_doc = AvtorefDoc.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @avtoref_doc = AvtorefDoc.new(params[:avtoref_doc])
    respond_to do |wants|
      if @avtoref_doc.save
        wants.html do
          flash[:notice] = "Successfully created avtoref doc."
          redirect_to @avtoref_doc
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @avtoref_doc = AvtorefDoc.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @avtoref_doc = AvtorefDoc.find(params[:id])
    respond_to do |wants|
      if @avtoref_doc.update_attributes(params[:avtoref_doc])
        wants.html do
          flash[:notice] = "Successfully updated avtoref doc."
          redirect_to @avtoref_doc
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @avtoref_doc = AvtorefDoc.find(params[:id])
    @avtoref_doc.destroy
    flash[:notice] = "Successfully removed avtoref doc."
    redirect_to avtoref_docs_url
  end
end

