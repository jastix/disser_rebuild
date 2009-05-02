class CreateAvtorefPdfs < ActiveRecord::Migration
  def self.up
    create_table :avtoref_pdfs do |t|
      t.string :apdf_file_name
      t.string :apdf_content_type
      t.integer :apdf_file_size
      t.integer :ipaper_id
      t.string :ipaper_access_key
      t.integer :theme_id
      t.timestamps
    end
        add_index :avtoref_pdfs, [:apdf_file_name]
        add_index :avtoref_pdfs, [:ipaper_access_key, :ipaper_id]
        add_index :avtoref_pdfs, :theme_id
  end

  def self.down
    drop_table :avtoref_pdfs
  end
end

