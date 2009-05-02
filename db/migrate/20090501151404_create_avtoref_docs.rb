class CreateAvtorefDocs < ActiveRecord::Migration
  def self.up
    create_table :avtoref_docs do |t|
      t.string :adoc_file_name
      t.string :adoc_content_type
      t.integer :adoc_file_size
      t.integer :ipaper_id
      t.string :ipaper_access_key
      t.integer :theme_id
      t.timestamps
    end
        add_index :avtoref_docs, [:adoc_file_name]
        add_index :avtoref_docs, [:ipaper_access_key, :ipaper_id]
        add_index :avtoref_docs, :theme_id
  end

  def self.down
    drop_table :avtoref_docs
  end
end

