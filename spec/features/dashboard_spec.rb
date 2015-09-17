#require "rails_helper"
#
#User.create(user_attributes)
#Project.create(project_attributes)
#
#describe "dashboard controller" do
#  before(:each) do
#    visit '/session/new'
#    fill_in 'email', :with => 'william.wallace@scotland.com'
#    fill_in 'password', :with => 'Testing1'
#    click_button 'Sign In'
#  end
#  it "shows dashboard" do
#    visit root_url
#    expect(page).to have_content 'Inbox'
#    expect(page).to have_content 'Personal'
#    expect(page).to have_content 'Project Folders'
#    expect(page).to have_content 'William Wallace'
#  end
#end
