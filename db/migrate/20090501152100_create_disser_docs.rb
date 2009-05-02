class CreateDisserDocs < ActiveRecord::Migration
  def self.up
    create_table :disser_docs do |t|
      t.string :ddoc_file_name
      t.string :ddoc_content_type
      t.integer :ddoc_file_size
      t.integer :ipaper_id
      t.string :ipaper_access_key
      t.integer :theme_id
      t.timestamps
    end
        add_index :disser_docs, [:ddoc_file_name]
        add_index :disser_docs, [:ipaper_access_key, :ipaper_id]
        add_index :disser_docs, :theme_id
  end

  def self.down
    drop_table :disser_docs
  end
end

