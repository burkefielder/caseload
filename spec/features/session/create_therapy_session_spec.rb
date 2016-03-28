require 'rails_helper'

describe 'Creating a new therapy session' do
  it 'saves the session note' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'Write Note'

    expect(current_path).to eq(new_student_session_path(student))

    fill_in 'Date', with: '2015-01-16'
    fill_in 'Minutes', with: 10
    fill_in 'Notes', with: 'He was a bit distracted.'

    click_button 'Save Note'

    expect(current_path).to eq(student_sessions_path(student))

    expect(page).to have_text('Therapy note successfully added')
  end

  it 'does not save the session note if it is invalid' do
    student = Student.create(student_attributes)

    visit new_student_session_url(student)

    expect { click_button 'Save Note' }.not_to change(Session, :count)

    expect(page).to have_text('could not be saved')
  end
end
