class CreateProfessions < ActiveRecord::Migration
  def self.up
    create_table :professions do |t|
      t.string :profession_name, :null => false
      t.string :code_name, :null => false

      t.timestamps
    end
        add_index :professions, [:profession_name, :code_name]

  end

  def self.down
    drop_table :professions
  end
end

