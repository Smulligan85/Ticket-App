require "rails_helper"

RSpec.feature "Users can edit an existing project" do

  before do
    FactoryGirl.create(:project, name: "Movie 1")

    visit "/"
    click_link "Movie 1"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Movie 2"
    click_button "Update Project"
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Movie 2"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end