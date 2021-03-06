require "rails_helper"
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = User.create!(user_attributes)
project = Project.create!(project_attributes)

describe "Signing in" do
  it "prompts for an email and password" do
    visit root_url
    click_link 'Sign In'
    expect(current_path).to eq(login_path)
    expect(body).to have_field("email")
    expect(body).to have_field("password")
  end
  it "signs in the user if the email/password combination is valid" do
    visit root_url
    click_link 'Sign In'
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button 'Sign In'
    expect(body).to have_text("#{user.name}")
  end
  it "does not sign in the user if the email/password combination is invalid" do
    visit root_url
    click_link 'Sign In'
    fill_in "email", with: user.email
    fill_in "password", with: "no match"
    click_button 'Sign In'
    expect(body).to have_text('Invalid email/password combination!')
  end
end
