require "rails_helper"

describe "Viewing the main site" do
  it "shows the main page" do
    visit root_url
    expect(page).to have_text("Sign In")
    expect(page).to have_text("Filarcis")
  end
end

describe "Viewing the sign in page" do
  it "shows the login page" do
    visit signin_path
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")
  end
end
