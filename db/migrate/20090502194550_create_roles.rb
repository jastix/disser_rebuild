class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    admin_role = Role.create(:name => 'admin')
    user_role = Role.create(:name => 'user')
    manager_role = Role.create(:name => 'manager')
    u = User.new(:email => 'jastix@dis.ru') do |u|
        u.password = u.password_confirmation = 123456
        u.confirm_email!
        u.roles << admin_role
        u.save!
        end
  end

  def self.down
    drop_table :roles
  end
end

