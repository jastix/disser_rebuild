class Subarea < ActiveRecord::Base
has_and_belongs_to_many :themes
validates_uniqueness_of :subarea_name
validates_presence_of :subarea_name
attr_accessible :subarea_ids, :subarea_name

before_save :edit_name
private
	def edit_name
		self.subarea_name = self.subarea_name.split(' ').map{|line| line.mb_chars.capitalize.to_s.humanize}.compact.join(" ").mb_chars.capitalize.to_s.humanize
	end
end

