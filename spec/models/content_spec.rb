require 'rails_helper'

describe Content do
  it {should belong_to(:project)}
  it {should validate_presence_of(:name)}
end
