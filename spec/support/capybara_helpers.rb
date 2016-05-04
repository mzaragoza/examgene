def page!
  save_and_open_page
end

def login_manager
    expect(page).to have_content('Sign In')
    fill_in('Email', with: 'manager@test.com')
    fill_in('Password', with: 'password')
    click_button "Log In"
    expect(page).to  have_content('Dashboard')
end

