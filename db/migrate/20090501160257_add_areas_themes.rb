class AddAreasThemes < ActiveRecord::Migration
  def self.up
  create_table "areas_themes", :id => false do |t|
    t.integer "area_id"
    t.integer "theme_id"
  end
  end

  def self.down
        drop_table :areas_themes
  end
end

