def sign_in(user)
  visit new_s_session_url
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Login'
end
