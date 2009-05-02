class Organization < ActiveRecord::Base
has_many :themes
validates_uniqueness_of :organization_name
validates_presence_of :organization_name
end

