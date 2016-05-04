require 'spec_helper'

describe "manager", type: :feature do
  before do
    FactoryGirl.create :manager, email: 'manager@test.com'
    visit(managers_root_path)
  end

  it "creates a new manager" do
    login_manager
    click_link "Managers"
    click_link "New"
    fill_in('manager_email', with: 'moisesZaragoza@test.com')
    fill_in('manager_password', with: 'password')
    fill_in('manager_first_name', with: 'Moises')
    fill_in('manager_last_name', with: 'Zaragoza')
    click_button "Create Manager"
    within ".page-title" do
      expect(page).to  have_content('Managers')
    end
    expect(page).to  have_content('Moises Zaragoza')
  end

  it "can not create 2 managers with the sama email" do
    login_manager
    click_link "Managers"
    click_link "New"
    fill_in('manager_email', with: 'manager@test.com')
    fill_in('manager_password', with: 'password')
    fill_in('manager_first_name', with: 'Moises')
    fill_in('manager_last_name', with: 'Zaragoza')
    click_button "Create Manager"
    within ".page-title" do
      expect(page).to  have_content('New Manager')
    end
    expect(page).to  have_content('Email has already been taken')
  end

  it "edits a manager" do
    login_manager
    click_link "Managers"
    within "#managers_1" do
      click_link "Edit"
    end
    fill_in('manager_email', with: 'moisesZaragoza@test.com')
    fill_in('manager_password', with: 'password')
    fill_in('manager_first_name', with: 'Moises')
    fill_in('manager_last_name', with: 'Zaragoza')
    click_button "Update Manager"
    within ".page-title" do
      expect(page).to  have_content('Managers')
    end
    expect(page).to  have_content('Moises Zaragoza')
  end
end

