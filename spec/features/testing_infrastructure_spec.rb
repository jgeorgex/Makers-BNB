feature "visiting homepage" do
  scenario "shows sign up form" do
    visit('/')
    expect(page).to have_content("Please sign up")
  end
end
