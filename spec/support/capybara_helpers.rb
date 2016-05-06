def page!
  save_and_open_page
end

def login_manager
    FactoryGirl.create :manager, email: 'test@test.com'
    visit(managers_root_path)
    expect(page).to have_content('Sign In')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'password')
    click_button "Log In"
    expect(page).to  have_content('Dashboard')
end
def login_user
    FactoryGirl.create :user, email: 'test@test.com'
    visit(users_root_path)
    expect(page).to have_content('Sign In')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'password')
    click_button "Log In"
    expect(page).to  have_content('Dashboard')
end

