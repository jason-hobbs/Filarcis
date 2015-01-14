require "rails_helper"

User.create(user_attributes)
Project.create(project_attributes)

describe "logging in" do
  it "logs a user in" do
    visit '/session/new'
    fill_in 'email', :with => 'william.wallace@scotland.com'
    fill_in 'password', :with => 'Testing1'
    click_button 'Sign In'
    expect(page).to have_content 'Inbox'
  end
end
