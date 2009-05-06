class AddProfessionsThemes < ActiveRecord::Migration
def self.up
    create_table "professions_themes", :id => false do |t|
    t.integer "profession_id"
    t.integer "theme_id"
  end
        add_index :professions_themes, [:profession_id, :theme_id]
  end

  def self.down
        drop_table :professions_themes
  end
end

