require 'spec_helper'

describe Answer, type: :feature do
  before do
    FactoryGirl.create(:test, name: 'Bio-1')
    FactoryGirl.create(:question, name: 'Biology is the study of ...?')
    FactoryGirl.create(:answer)
    login_user
    click_link "Tests"
    click_link "Bio-1"
    click_link "Biology is the study of ...?"
  end

  it "add a questiom to a test" do
    click_link "New"
    fill_in('answer_name', with: 'Live Science')
    click_button "Create Answer"
    within ".page-title" do
      expect(page).to  have_content('Test: Bio-1, Queston: Biology is the study of ...?')
    end
    expect(page).to  have_content('Live Science')
  end

  it "edits a questiom from a test" do
    click_link "Edit"
    fill_in('answer_name', with: 'Live Science')
    click_button "Update Answer"
    within ".page-title" do
      expect(page).to  have_content('Test: Bio-1, Queston: Biology is the study of ...?')
    end
    expect(page).to  have_content('Live Science')
  end
end

