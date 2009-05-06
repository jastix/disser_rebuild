class Area < ActiveRecord::Base
has_and_belongs_to_many :themes
validates_uniqueness_of :area_name
validates_presence_of :area_name
attr_accessible :area_ids, :area_name

before_save :edit_name
private
	def edit_name
		self.area_name = self.area_name.split(' ').map{|line| line.mb_chars.capitalize.to_s.humanize}.compact.join(" ").mb_chars.capitalize.to_s.humanize
	end
end

