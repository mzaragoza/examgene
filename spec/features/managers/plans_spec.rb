require 'spec_helper'

describe "Plan", type: :feature do
  before do
    login_manager
  end

  it "creates a new plan" do
    click_link "Plans"
    click_link "New"
    fill_in('plan_name', with: 'Starter')
    fill_in('plan_slug', with: 'starter')
    fill_in('plan_price', with: 10.50)
    click_button "Create Plan"
    within ".page-title" do
      expect(page).to  have_content('Plans')
    end
    expect(page).to  have_content('Starter')
  end

  it "can not create 2 plans with the same name or slug" do
    FactoryGirl.create(:plan, name: 'Starter', slug: 'starter')
    click_link "Plans"
    click_link "New"
    fill_in('plan_name', with: 'Starter')
    fill_in('plan_slug', with: 'starter')
    fill_in('plan_price', with: 10.50)
    click_button "Create Plan"
    within ".page-title" do
      expect(page).to  have_content('New Plan')
    end
    expect(page).to  have_content('Name has already been taken')&
      have_content('Slug has already been taken')
  end

  it "edits a manager" do
    FactoryGirl.create(:plan, name: 'Starter', slug: 'starter')
    click_link "Plans"
    click_link "Edit"
    fill_in('plan_name', with: 'Pro')
    fill_in('plan_price', with: 10.50)
    click_button "Update Plan"
    within ".page-title" do
      expect(page).to  have_content('Plans')
    end
    expect(page).to  have_content('Pro')
  end
end

