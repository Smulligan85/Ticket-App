require "rails_helper"

RSpec.feature "Users can edit an existing project" do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: "Project 1") }

  before do
    login_as(user)
    assign_role!(user, :manager, project)
    visit "/"
    click_link "Project 1"
    click_link "Edit Project"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Project 2"
    click_button "Update Project"
    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "Project 2"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end