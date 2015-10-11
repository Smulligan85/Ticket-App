require "rails_helper"

RSpec.feature "Admin users can create new users" do
  let(:admin) { FactoryGirl.create(:user, :admin) }

  before do
    login_as(admin)
    visit "/"
    click_link "Admin"
    click_link "Users"
    click_link "New Users"
  end

  scenario "with valid attributes" do
    fill_in "Email", with: "newbie@example.com"
    fill_in "Password", with: "password"
    click_button "Create User"
    expect(page).to have_content "User has been created."
  end

  scenario "create admin user" do
    fill_in "Email", with: "fooadmin@example.com"
    fill_in "Password", with: "password"
    check "Is an admin?"
    click_button "Create User"
    expect(page).to have_content "User has been created."
    expect(page).to have_content "fooadmin@example.com (Admin)"
  end
  
end 