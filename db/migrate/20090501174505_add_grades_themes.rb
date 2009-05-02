class AddGradesThemes < ActiveRecord::Migration
  def self.up
create_table "grades_professions", :id => false do |t|
    t.integer "grade_id"
    t.integer "profession_id"
  end
        add_index :grades_professions, [:grade_id, :profession_id]
  end

  def self.down
        drop_table :grades_professions
  end
end

