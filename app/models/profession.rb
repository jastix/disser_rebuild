class Profession < ActiveRecord::Base

has_and_belongs_to_many :themes
validates_uniqueness_of :profession_name
validates_uniqueness_of :code_name
validates_presence_of :profession_name
attr_accessible :profession_ids, :profession_name, :code_name

before_save :edit_name
private
	def edit_name
		self.profession_name = self.profession_name.split(' ').map{|line| line.mb_chars.capitalize.to_s.humanize}.compact.join(" ").mb_chars.capitalize.to_s.humanize
	end
end

