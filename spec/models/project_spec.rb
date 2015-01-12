# spec/models/project.rb
require 'rails_helper'


describe Project do
  it "has a valid factory" do
    expect(FactoryGirl.create(:project)).to be_valid
  end
  it "is invalid without a name" do
    expect(FactoryGirl.build(:project, name: nil)).to_not be_valid
  end
end
