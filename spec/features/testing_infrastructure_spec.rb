feature "visiting homepage" do
  scenario "shows sign up form" do
    visit('/')
    expect(page).to have_content("Please sign up")
  end
end

feature "Signing up" do
  scenario "submits and directs new user information" do
    sign_up
    expect(page).to have_content("Welcome abc")
  end
end
