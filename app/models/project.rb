class Project < ActiveRecord::Base
  belongs_to :user
  has_many :contents, dependent: :destroy
  has_many :notes, dependent: :destroy
  validates :name, presence: true
  has_ancestry
end
