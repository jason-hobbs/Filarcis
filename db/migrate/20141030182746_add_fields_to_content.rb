class AddFieldsToContent < ActiveRecord::Migration
  def change
    add_column :contents, :content_type, :string
    add_column :contents, :file_size, :string
  end
end
