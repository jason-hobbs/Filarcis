class AddLocationToContents < ActiveRecord::Migration
  def change
    add_column :contents, :location, :string
  end
end
