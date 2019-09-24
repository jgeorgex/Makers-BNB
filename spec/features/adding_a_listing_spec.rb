feature "managing listings" do
  scenario "adding a listing" do
    sign_up
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
