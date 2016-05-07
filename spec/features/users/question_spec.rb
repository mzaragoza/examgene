require 'spec_helper'

describe Question, type: :feature do
  before do
    FactoryGirl.create(:test, name: 'Bio-1')
    FactoryGirl.create(:question)
    login_user
    click_link "Tests"
    click_link "Bio-1"
  end

  it "add a questiom to a test" do
    click_link "New"
    fill_in('question_name', with: 'Biology is the study of ...')
    click_button "Create Question"
    within ".page-title" do
      expect(page).to  have_content('Test: Bio-1')
    end
    expect(page).to  have_content('Biology is the study of ...')
  end

  it "edits a questiom from a test" do
    click_link "Edit"
    fill_in('question_name', with: 'Biology is the study of ...')
    click_button "Update Question"
    within ".page-title" do
      expect(page).to  have_content('Test: Bio-1')
    end
    expect(page).to  have_content('Biology is the study of ...')
  end
end


