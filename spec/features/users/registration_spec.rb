require 'spec_helper'

describe User, type: :feature do
  before do
    FactoryGirl.create(:plan)
    visit(new_user_registration_path)
  end

  it "registers an account" do
    fill_in('user_account_attributes_domain', with: 'dragon')
    fill_in('user_account_attributes_name', with: 'Dragon School')
    fill_in('user_email', with: 'test@dragonschool.com')
    fill_in('user_password', with: 'password')
    click_button "Create Account"
    expect(page).to  have_content('Dashboard')
  end

  it " can not register an account with a domanin that all ready exists " do
    FactoryGirl.create(:account, domain: 'dragon' )
    fill_in('user_account_attributes_domain', with: 'dragon')
    fill_in('user_account_attributes_name', with: 'Dragon School')
    fill_in('user_email', with: 'test@dragonschool.com')
    fill_in('user_password', with: 'password')
    click_button "Create Account"
    expect(page).not_to  have_content('Dashboard')
    expect(page).to  have_content('Account domain has already been taken')
  end

end
