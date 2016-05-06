require 'spec_helper'

describe Test, type: :feature do
  before do
    login_user
  end

  it "creates a new test" do
    click_link "Tests"
    click_link "New"
    fill_in('test_name', with: 'Bio1')
    click_button "Create Test"
    within ".page-title" do
      expect(page).to  have_content('Tests')
    end
    expect(page).to  have_content('Bio1')
  end

  it "edits a test" do
    FactoryGirl.create(:test)
    click_link "Tests"
    click_link "Edit"
    fill_in('test_name', with: 'Bio1')
    click_button "Update Test"
    within ".page-title" do
      expect(page).to  have_content('Tests')
    end
    expect(page).to  have_content('Bio1')
  end
end

