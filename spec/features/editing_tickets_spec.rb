require "rails_helper"

RSpec.feature "User can edit existing tickets" do
  let(:author) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:ticket) do
    FactoryGirl.create(:ticket, project: project, author: author)
  end

  before do
    assign_role!(author, :viewer, project)
    login_as(author)
    visit project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Make it really new!"
    click_button "Update Ticket"

    expect(page).to have_content "Make it really new!"

    within("#ticket h2") do
      expect(page).to have_content "Make it really new!"
      expect(page).not_to have_content ticket.name
    end
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has not been updated."
  end
end
