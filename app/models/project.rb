class Project < ActiveRecord::Base
  belongs_to :user
  has_many :contents
  has_many :notes
  has_ancestry
end
