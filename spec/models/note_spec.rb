require 'rails_helper'

describe Note do
  it {should belong_to(:project)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:project_id)}
  it {should validate_length_of(:content).is_at_least(2)}
  it {should validate_length_of(:content).is_at_most(10000) }
end
