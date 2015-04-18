require 'rails_helper'

feature 'Siging in', %q{
  In order to be able ask questions
  As an user
  I want be able to sign in
 } do

	scenario 'Registered user try to sign in' do
		User.create!(email: 'user@test.com', password: '12345678')
		visit new_user_session_path
		fill_in 'Email', with: 'user@test.com'
		fill_in 'Password', with: '12345678'
		click_on 'Sign in'

		expect(page).to have_content 'Signed in successfully.'
		expect(current_path).to eq root_path
    end

    scenario 'Non-registered user try to sign in' do
		visit new_user_session_path
		fill_in 'Email', with: 'wrong@user.com'
		fill_in 'Password', with: '12345'
		click_on 'Sign in'

		expect(page).to have_content 'Invalid email or password.'
		expect(current_path).to eq new_user_session_path
	end
=begin
  given(:user) { create(:user) }

  scenario "Existing user try to sign in" do
    sign_in(user)

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Non-existing user try to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@user.com'
    fill_in 'Password', with: '12345'
    click_on 'Sign in'

    expect(page).to have_content 'Invalid email or password.'
  end
=end
end