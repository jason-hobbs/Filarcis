class Project < ActiveRecord::Base
  belongs_to :user
  has_many :contents, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_ancestry
end
