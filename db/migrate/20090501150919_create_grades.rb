class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.string :grade_name, :null => false
      t.timestamps
    end
        add_index :grades, [:grade_name]
  end

  def self.down
    drop_table :grades
  end
end

