require "rails_helper"

feature "Role changer", :sorcery do

  scenario "admin can change roles of users" do
    user = create(:user)
    admin = create(:admin)
    signin(admin.email, "password")
    visit users_path
    within(".css_row", text: user.email) do
      select("Admin", from: "user_role")
      click_on("Change Role")
    end
    expect(page).to have_content "User updated successfully"
  end
end
