class CreateProfessions < ActiveRecord::Migration
  def self.up
    create_table :professions do |t|
      t.string :profession_name, :null => false
      t.string :code_name, :null => false
      t.integer :grade_id, :null => false
      t.timestamps
    end
        add_index :professions, [:profession_name, :code_name]
        add_index :professions, [:grade_id]
  end

  def self.down
    drop_table :professions
  end
end

