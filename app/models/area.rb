class Area < ActiveRecord::Base
has_and_belongs_to_many :themes
validates_uniqueness_of :area_name
validates_presence_of :area_name
attr_accessible :area_ids, :area_name
end

