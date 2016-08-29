require "rails_helper"

feature "Search" do
  scenario "admin can search for a query" do
    admin = create(:admin)
    signin(admin.email, "password")
    test_query = "test query"
    fill_in "search-field", with: test_query
    find_button("search-button").click
    expect(page).to have_content "search result(s) for \"#{test_query}\""
  end
end
