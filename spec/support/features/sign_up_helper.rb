module Features
  module SignUpHelpers
    def signup(first_name, last_name, email, password, password_confirmation)
      admin_user = create(:admin)
      signin(admin_user.email, "password")
      visit new_user_path
      fill_in "First name", with: first_name
      fill_in "Last name", with: last_name
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password_confirmation
      click_on "Submit"
    end
  end
end
