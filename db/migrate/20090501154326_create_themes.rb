class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :theme_name, :null => false
      t.string :fio, :null => false
      t.string :year_name, :null => false
      t.text :text_avtoref
      t.text :text_disser
      t.integer :profession_id, :null => false
      t.integer :organization_id, :null => false
      t.boolean :delta
      t.timestamps
    end
        add_index :themes, [:theme_name, :fio]
        add_index :themes, [:profession_id]
        add_index :themes, [:organization_id]

  end

  def self.down
    drop_table :themes
  end
end

