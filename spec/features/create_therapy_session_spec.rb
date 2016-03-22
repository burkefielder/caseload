require 'rails_helper'

describe 'Creating a new therapy session' do
  it 'saves the session note' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'Write Note'

    expect(current_path).to eq(new_student_session_path(student))

    fill_in 'First Name', with: 'Roger'
    fill_in 'Comment', with: 'He was a bit distracted.'

    click_button 'Save Note'

    expect(current_path).to eq(student_sessions_path(student))

    expect(page).to have_text('Successfully added note.')
  end

  it 'does not save the session note if it is invalid' do
    student = Student.create(student_attributes)

    visit new_student_session_url(student)

    expect { click_button 'Save Note' }.not_to change(Session, :count)

    expect(page).to have_text('error')
  end
end
