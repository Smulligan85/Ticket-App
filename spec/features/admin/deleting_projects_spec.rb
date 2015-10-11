require "rails_helper"

RSpec.feature "Users can delete projects" do

  before do
    login_as(FactoryGirl.create(:user, :admin))
  end
  
  scenario "successfully" do
    FactoryGirl.create(:project, name: "Movie 1")

    visit "/"
    click_link "Movie 1"
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted."
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content "Movie 1"
  end
end