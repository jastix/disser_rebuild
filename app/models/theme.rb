class Theme < ActiveRecord::Base

validates_presence_of :theme_name
validates_uniqueness_of :theme_name
validates_presence_of :fio
validates_presence_of :year_name
validates_presence_of :organization_id
validates_presence_of :profession_id
belongs_to :profession
belongs_to :organization
has_and_belongs_to_many :areas
has_and_belongs_to_many :subareas

has_one :avtoref_doc, :dependent => :destroy
has_one :avtoref_pdf, :dependent => :destroy
has_one :disser_doc, :dependent => :destroy
has_one :disser_pdf, :dependent => :destroy

accepts_nested_attributes_for :avtoref_doc, :allow_destroy => :true
accepts_nested_attributes_for :avtoref_pdf, :allow_destroy => :true
accepts_nested_attributes_for :disser_doc, :allow_destroy => :true
accepts_nested_attributes_for :disser_pdf, :allow_destroy => :true

attr_accessible :fio, :theme_name, :text_avtoref, :text_disser, :year_name, :organization_id, :profession_id, :area_ids, :subarea_ids, :avtoref_doc_attributes, :avtoref_pdf_attributes, :disser_doc_attributes, :disser_pdf_attributes



define_index do
		indexes fio
		indexes theme_name
		indexes text_avtoref
		indexes text_disser
		indexes year_name
		indexes [profession.profession_name, profession.code_name], :as => :profession
		indexes organization.organization_name, :as => :organization
		set_property :enable_star => 1
		set_property :min_prefix_len => 3
		set_property :delta => true

	end


before_save :edit_title, :edit_name

def edit_title
		#удаление кавычек в начале и конце строки и в начале строки
		if theme_name[0] == 34 and theme_name[-1] == 34 then
     			 self.theme_name = theme_name.slice(1...theme_name.length-1)
      		end

    		if theme_name[0] == 34  then
      		self.theme_name = theme_name.slice(1...theme_name.length)
      		end

	#первая буква заглавная
		self.theme_name = self.theme_name.split(' ').map {|line| line.humanize}.compact.join(" ").humanize

	end

	def edit_name
		self.fio = self.fio.split(' ').map {|line| line.downcase.humanize}.compact.join(" ").humanize
	end
end

