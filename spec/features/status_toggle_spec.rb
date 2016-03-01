require "rails_helper"

feature "status button toggler" do

  scenario "admin is able to change status of log" do
    user = create(:admin)
    log = create(:log)
    signin(user.email, "password")
    visit log_path(log)
    status_button = find("#status-#{log.id}")
    expect(page).to have_css("a.status_not_processed")
    status_button.click
    visit log_path(log)
    expect(page).to have_css("a.status_processed")
    status_button.click
    visit log_path(log)
    expect(page).to have_css("a.status_not_processed")
  end
end
