class Subarea < ActiveRecord::Base
has_and_belongs_to_many :themes
validates_uniqueness_of :subarea_name
validates_presence_of :subarea_name
attr_accessible :subarea_ids, :subarea_name
end

