class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photo_file_name, :string
    remove_column :users, :photo_content_type, :string
    remove_column :users, :photo_file_size, :string
    remove_column :users, :photo_updated_at, :string
  end
end
