require 'rails_helper'

describe 'Editing an individual note' do
  it 'updates the note details' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)

    visit student_sessions_url(session)

    click_link 'Edit'

    expect(current_path).to eq(edit_student_session_path(student, session))
    expect(find_field('Date').value).to eq(session.date.strftime('%F'))
    expect(find_field('Minutes').value).to eq(session.minutes.to_s)
    expect(find_field('Therapy').value).to eq(session.therapy)
    expect(find_field('Notes').value).to eq(session.notes)
  end
  it 'shows the updated session details' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)

    visit student_sessions_url(session)

    click_link 'Edit'

    fill_in 'Notes', with: 'I am changing the note.'

    click_button 'Save Note'

    expect(current_path).to eq(student_sessions_path(student))
    expect(page).to have_text('I am changing the note.')
    expect(page).to have_text('Note successfully updated!')
  end
  it 'returns the user to the edit screen if the information is invalid' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)

    visit student_sessions_url(session)

    click_link 'Edit'

    fill_in 'Date', with: ''

    click_button 'Save Note'

    expect(current_path).to eq(student_session_path(student, session))
    expect(page).to have_text('session could not be saved')
  end
end
