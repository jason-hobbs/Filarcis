class Content < ActiveRecord::Base
  belongs_to :project
  mount_uploader :location, LocationUploader
  validates :name, presence: true
end
