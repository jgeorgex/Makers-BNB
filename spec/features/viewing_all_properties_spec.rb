feature "viewing all properties" do
  scenario "viewing three properties owned by two users" do
    populate_property_database
    sign_up
    click_on 'view'
    expect(page).to have_content('123 Test Road')
    expect(page).to have_content('1 Commercial St')
    expect(page).to have_content('7 Test Street')
  end
end
