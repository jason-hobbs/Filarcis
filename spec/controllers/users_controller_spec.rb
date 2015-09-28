require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

user = User.create!(user_attributes)
project = Project.create!(project_attributes)

describe UsersController do
  context "when not signed in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
      get :index
      expect(response).to redirect_to(login_url)
    end
    it "cannot access show" do
      get :show, id: user
      expect(response).to redirect_to(login_url)
    end
    it "cannot access edit" do
      get :edit, id: user
      expect(response).to redirect_to(login_url)
    end
    it "cannot access update" do
      patch :update, id: user
      expect(response).to redirect_to(login_url)
    end
    it "cannot access destroy" do
      delete :destroy, id: user
      expect(response).to redirect_to(login_url)
    end
  end
end
