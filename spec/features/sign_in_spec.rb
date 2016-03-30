require 'rails_helper'

describe 'Signing in' do
  it 'prompts for an email and password' do
    visit root_url

    click_link 'Login'

    expect(page).to have_css('input#email')
    expect(page).to have_css('input#password')
  end

  it 'signs in the user if the email/password combination is valid' do
    user = User.create!(user_attributes)

    visit root_url

    click_link 'Login'

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password

    click_button 'Login'

    expect(current_path).to eq(user_path(user))

    expect(page).to have_text("Welcome back, #{user.name}!")
    expect(page).to have_link('Sign Out')
  end

  it 'does not sign in the user if the email/password combination is invalid' do
    user = User.create!(user_attributes)

    visit root_url

    click_link 'Login'

    fill_in 'email', with: user.email
    fill_in 'password', with: 'no match'

    click_button 'Login'

    expect(page).to have_text('Invalid')
    expect(page).not_to have_link('Sign Out')
  end
end
