require "rails_helper"

feature "User index page", :sorcery do
  scenario "user's email is displayed" do
    user = FactoryGirl.create(:user, :admin)
    login_user(user, user_sessions_path)
    visit users_path
    expect(page).to have_content user.email
  end
end
