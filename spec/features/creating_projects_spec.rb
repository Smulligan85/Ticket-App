require "rails_helper"

RSpec.feature "Users can create new projects" do
  scenario "with valid attributes" do
    visit "/"
    click_link "New Project"

    fill_in "Name", with: "The Visit"
    fill_in "Description", with: "New Horror Movie"
    click_button "Create Project"

    expect(page).to have_content "Project is saved."
  end
end
