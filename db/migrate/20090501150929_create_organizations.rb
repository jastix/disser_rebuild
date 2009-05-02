class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :organization_name, :null => false
      t.timestamps
    end
        add_index :organizations, [:organization_name]
  end

  def self.down
    drop_table :organizations
  end
end

