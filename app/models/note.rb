class Note < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true
  validates :project_id, presence: true
  validates_length_of :content, :in => 2..50000, :allow_blank => false
end
