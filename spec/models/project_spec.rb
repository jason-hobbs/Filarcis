require 'rails_helper'

describe Project do
  it {should belong_to(:user)}
  it { should have_many(:contents) }
  it { should have_many(:notes) }
  it {should validate_presence_of(:name)}
end
