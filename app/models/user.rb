class User < ActiveRecord::Base
  include Clearance::User

attr_accessible :role_ids
has_and_belongs_to_many :roles

def has_role?(role)
    list ||= self.roles.map(&:name)
    list.include?(role.to_s) || list.include?('admin')
  end
end

