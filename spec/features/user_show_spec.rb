require "rails_helper"

feature "User show page", :sorcery do

  scenario "user's email is displayed" do
    user = create(:user, :admin)
    signin(user.email, "password")
    visit user_path(user)
    expect(page).to have_content user.email
  end
end
