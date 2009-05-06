class Organization < ActiveRecord::Base
has_many :themes
validates_uniqueness_of :organization_name
validates_presence_of :organization_name

before_save :edit_name
private
	def edit_name
		self.organization_name = self.organization_name.split(' ').map{|line| line.mb_chars.capitalize.to_s.humanize}.compact.join(" ")
	end
end

