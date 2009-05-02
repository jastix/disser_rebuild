class CreateSubareas < ActiveRecord::Migration
  def self.up
    create_table :subareas do |t|
      t.string :subarea_name, :null => false
      t.timestamps
    end
        add_index :subareas, [:subarea_name]
  end

  def self.down
    drop_table :subareas
  end
end

