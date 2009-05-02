class Profession < ActiveRecord::Base
belongs_to :grade
has_many :themes
validates_uniqueness_of :profession_name
validates_presence_of :profession_name

before_save :edit_name
private
	def edit_name
		self.profession_name = self.profession_name.split(' ').map{|line| line.humanize}.compact.join(" ").humanize
	end
end

