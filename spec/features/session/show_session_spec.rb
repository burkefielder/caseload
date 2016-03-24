require 'rails_helper'

describe 'Viewing an individual session note' do
  it 'shows the Note details' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)

    visit student_sessions_url(student)

    expect(page).to have_text(student.first_name)
    expect(page).to have_text(student.last_name)
    expect(page).to have_text(session.date)
    expect(page).to have_text(session.minutes)
    expect(page).to have_text(session.notes)
    expect(page).to have_text(session.therapy)
  end
end
