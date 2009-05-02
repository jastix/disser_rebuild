class CreateDisserPdfs < ActiveRecord::Migration
  def self.up
    create_table :disser_pdfs do |t|
      t.string :dpdf_file_name
      t.string :dpdf_content_type
      t.integer :dpdf_file_size
      t.integer :ipaper_id
      t.string :ipaper_access_key
      t.integer :theme_id
      t.timestamps
    end
        add_index :disser_pdfs, [:dpdf_file_name]
        add_index :disser_pdfs, [:ipaper_access_key, :ipaper_id]
        add_index :disser_pdfs, :theme_id
  end

  def self.down
    drop_table :disser_pdfs
  end
end

