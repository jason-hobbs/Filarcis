class AddMigrationToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :content, index: true
  end
end
