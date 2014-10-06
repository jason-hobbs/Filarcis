class AddReferenceToContent < ActiveRecord::Migration
  def change
    add_reference :contents, :project, index: true
  end
end
