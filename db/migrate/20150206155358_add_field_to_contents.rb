class AddFieldToContents < ActiveRecord::Migration
  def change
    add_column :contents, :public, :boolean, default: false
  end
end
