require 'spec_helper'

describe Plan, type: :feature do
  before do
    FactoryGirl.create :plan, name: 'Starter', price: 19.99
    visit(root_path)
  end

  it "I should see a plan on the homeoage" do
    expect(page).to have_content('Starter')
    expect(page).to have_content('$19.99 /Montly')
  end

  it "I should not see a plan that is not active on the homeoage" do
    FactoryGirl.create :plan, name: 'Inactive', price: 29.99, active: false
    expect(page).not_to have_content('Inactive')
    expect(page).not_to have_content('$29.99 /Montly')
  end

#  it "I should be able to select a plan" do
#    click_link "$19.99"
#    expect(page).to have_content('Create An Account')
#  end
end

