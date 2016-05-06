require 'spec_helper'

describe User, type: :feature do
  before do
    login_user
  end

  it "creates a new user" do
    click_link "Users"
    click_link "New"
    fill_in('user_email', with: 'moisesZaragoza@test.com')
    fill_in('user_password', with: 'password')
    fill_in('user_first_name', with: 'Moises')
    fill_in('user_last_name', with: 'Zaragoza')
    click_button "Create User"
    within ".page-title" do
      expect(page).to  have_content('Users')
    end
    expect(page).to  have_content('Moises Zaragoza')
  end

  it "can not create 2 users with the sama email" do
    click_link "Users"
    click_link "New"
    fill_in('user_email', with: 'test@test.com')
    fill_in('user_password', with: 'password')
    fill_in('user_first_name', with: 'Moises')
    fill_in('user_last_name', with: 'Zaragoza')
    click_button "Create User"
    within ".page-title" do
      expect(page).to  have_content('New User')
    end
    expect(page).to  have_content('Email has already been taken')
  end

  it "edits a user" do
    click_link "Users"
    click_link "Edit"
    fill_in('user_email', with: 'moisesZaragoza@test.com')
    fill_in('user_password', with: 'password')
    fill_in('user_first_name', with: 'Claudia')
    fill_in('user_last_name', with: 'Alvarez')
    click_button "Update User"
    within ".page-title" do
      expect(page).to  have_content('Users')
    end
    expect(page).to  have_content('Claudia Alvarez')
  end

  it "edits a manager with out updateing the password" do
    click_link "Users"
    click_link "Edit"
    fill_in('user_email', with: 'moisesZaragoza@test.com')
    fill_in('user_first_name', with: 'Claudia')
    fill_in('user_last_name', with: 'Alvarez')
    click_button "Update User"
    within ".page-title" do
      expect(page).to  have_content('Users')
    end
    expect(page).to  have_content('Claudia Alvarez')
  end
end

