require "rails_helper"

feature "Log submit", :sorcery do
  scenario "user can submit a log" do
    user = create(:user)
    log = build(:log)
    signin(user.email, "password")
    visit new_log_path
    fill_in "Last Name (Staff)", with: log.staff_last_name
    fill_in "First Name (Member)", with: log.member_first_name
    fill_in "Last Name (Member)", with: log.member_last_name
    fill_in "Date", with: "02-23-2016"
    fill_in "Duration (minutes)", with: log.duration
    fill_in "timepicker", with: log.end_time
    fill_in "Activity Log", with: log.activity_log
    fill_in "Follow-up", with: log.follow_up
    check "Education Support"
    check "Intensive Supported Employment"
    find_button('submit_log').click
    expect(page).to have_content "Log submitted successfully"
  end
end
