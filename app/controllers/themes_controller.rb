class ThemesController < ApplicationController

before_filter :authenticate

  def index
    #@themes = Theme.all

    page = params[:page] || 1
    @search = Theme.search params[:q], :include => :profession, :include => :organization, :include => :areas, :match_mode => :extended, :field_weights => { :theme_name => 20, :fio => 15, :profession => 10 },:page => page,  :per_page => 10

    @themes = @search
    @paging = @search
  end

  def new
    @theme = Theme.new
    @years = 1950.to_s..Time.now.strftime('%Y')
    @organizations = Organization.find(:all)
    @professions = Profession.find(:all)
    #@theme.avtoref_doc.build
    respond_to do |wants|
      wants.html

    end

  end

 def show


  	@theme = Theme.find(params[:id])
  end

  def create
params[:theme][:area_ids] ||= []
	params[:theme][:subarea_ids] ||= []
  	@areas = Area.find(:all)
  	@grades = Grade.find(:all)
	@subareas = ""
  	@professions = Profession.find(:all)
  	@organizations = Organization.find(:all)

    @theme = Theme.create(params[:theme])
    respond_to do |wants|
      if @theme.save
        wants.html do
          flash[:notice] = "Запись добавлена."
          redirect_to themes_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
@professions = Profession.find(:all)
@organizations = Organization.find(:all)
@years = 1950.to_s..Time.now.strftime('%Y')
    @theme = Theme.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @theme = Theme.find(params[:id])
    respond_to do |wants|
      if @theme.update_attributes(params[:theme])
        wants.html do
          flash[:notice] = "Запись сохранена."
          redirect_to themes_url
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    flash[:notice] = "Запись удалена."
    redirect_to themes_url
  end


        def show_avtoref_pdf

		@theme = Theme.find(params[:id])

		render :action => :show_avtoref_pdf
	end

	def show_avtoref_doc

		@theme = Theme.find(params[:id])

		render :action => :show_avtoref_doc
	end

	def show_disser_pdf

		@theme = Theme.find(params[:id])
		render :action => :show_disser_pdf
	end

	def show_disser_doc

		@theme = Theme.find(params[:id])
		render :action => :show_disser_doc
	end


def download_avtoref_doc

	@theme = Theme.find(params[:id])
	# путь к файлу после папки public = @theme.avtoref_doc.url
	send_file ("#{RAILS_ROOT}" + "/" + "public" + @theme.avtoref_doc.adoc.url)
end

def download_avtoref_pdf

	@theme = Theme.find(params[:id])
	# путь к файлу после папки public = @theme.avtoref_doc.url
	send_file ("#{RAILS_ROOT}" + "/" + "public" + @theme.avtoref_pdf.apdf.url)
end

def download_disser_doc

	@theme = Theme.find(params[:id])
	# путь к файлу после папки public = @theme.avtoref_doc.url
	send_file ("#{RAILS_ROOT}" + "/" + "public" + @theme.disser_doc.ddoc.url)
end

def download_disser_pdf

	@theme = Theme.find(params[:id])
	# путь к файлу после папки public = @theme.avtoref_doc.url
	send_file ("#{RAILS_ROOT}" + "/" + "public" + @theme.disser_pdf.dpdf.url)
end


end

