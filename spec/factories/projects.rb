# spec/factories/projects.rb

require 'faker'

FactoryGirl.define do
  factory :project do |f|
    f.id 1
    f.name { Faker::Name.name }
    f.user_id 1
  end
end
