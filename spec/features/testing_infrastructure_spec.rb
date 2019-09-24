feature "visiting homepage" do
  scenario "shows sign up form" do
    visit('/')
    expect(page).to have_content("Please sign up")
  end
end

feature "Signing up" do
  scenario "submits and directs new user information" do
    visit('/')
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'username', with: 'abc'
    fill_in 'firstname', with: 'abc'
    fill_in 'lastname', with: 'xyz'
    fill_in 'password', with: 'qwerty'
    click_button 'submit'
    expect(page).to have_content("Welcome abc")
  end
end
