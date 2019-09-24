feature "managing listings" do
  scenario "adding a listing" do
    visit('/')
    fill_in 'email', with: 'abc@gmail.com'
    fill_in 'username', with: 'abc'
    fill_in 'firstname', with: 'abc'
    fill_in 'lastname', with: 'xyz'
    fill_in 'password', with: 'qwerty'
    click_button 'submit'
    p current_path
    click_on 'manage'
    expect(page).not_to have_content('test house')
    fill_in 'address', with: '123, address road'
    fill_in 'capacity', with: 4
    fill_in 'description', with: 'a standard plain house'
    fill_in 'pricepn', with: 4
    click_on 'submit'
    expect(page).to have_content('123, address road')
  end
end
