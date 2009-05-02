class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas do |t|
      t.string :area_name, :null => false
      t.timestamps
    end
        add_index :areas, [:area_name]
  end

  def self.down
    drop_table :areas
  end
end

