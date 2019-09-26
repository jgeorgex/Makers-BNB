feature "logging in" do
  scenario "existing user can log in" do
    sign_up
    visit '/'
    click_on 'login'
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'password', with: 'qwerty'
    click_on 'submit'
    expect(page).to have_content('Welcome abc')
  end

  scenario "wrong details cant log in" do
    sign_up
    visit '/'
    click_on 'login'
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'password', with: 'werty'
    click_on 'submit'
    expect(page).to_not have_content('Welcome abc')
  end

end
