require "rails_helper"

feature "User index page", :sorcery do

  scenario "user's email is displayed" do
    user = create(:user, :admin)
    signin(user.email, "password")
    visit users_path
    expect(page).to have_content user.email
    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
  end
end
