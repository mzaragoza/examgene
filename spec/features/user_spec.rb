require 'spec_helper'

describe User, type: :feature do
  before do
    FactoryGirl.create :user, email: 'user@test.com'
    visit(users_root_path)
  end

  it "logs in" do
    expect(page).to have_content('Sign In')
    fill_in('Email', with: 'user@test.com')
    fill_in('Password', with: 'password')
    click_button "Log In"
    expect(page).to  have_content('Dashboard')
  end

  it "should not login with an user that is not active" do
    FactoryGirl.create :user, email: 'inactice@test.com', active: false
    expect(page).to have_content('Sign In')
    fill_in('Email', with: 'inactice@test.com')
    fill_in('Password', with: 'password')
    click_button "Log In"
    expect(page).not_to  have_content('Dashboard')
    expect(page).to have_content('Sign In')
  end

  it "logs out" do
    login_user
    click_link "Logout"
    expect(page).to have_content('Explore amazing features')
  end

end

