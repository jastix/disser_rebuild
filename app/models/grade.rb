class Grade < ActiveRecord::Base
has_many  :themes
validates_uniqueness_of :grade_name
validates_presence_of :grade_name
attr_accessible :grade_ids, :grade_name

before_save :edit_name
private
	def edit_name
		self.grade_name = self.grade_name.split(' ').map{|line| line.mb_chars.capitalize.to_s.humanize}.compact.join(" ").mb_chars.capitalize.to_s.humanize
	end
end

