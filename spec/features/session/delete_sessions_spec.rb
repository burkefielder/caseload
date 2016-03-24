require 'rails_helper'

describe 'Deleting a therapy note' do
  it 'destroys the note and shows the listing
    without the deleted note' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)

    visit edit_student_session_path(student, session)

    click_link 'Delete Note'

    expect(current_path).to eq(student_sessions_path(student))
    expect(page).not_to have_text(session.date)
  end
end
