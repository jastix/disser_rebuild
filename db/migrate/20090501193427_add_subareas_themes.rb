class AddSubareasThemes < ActiveRecord::Migration
  def self.up
create_table "subareas_themes", :id => false do |t|
    t.integer "subarea_id"
    t.integer "theme_id"
  end
        add_index :subareas_themes, [:subarea_id, :theme_id]
  end

  def self.down
        drop_table :subareas_themes
  end
end

