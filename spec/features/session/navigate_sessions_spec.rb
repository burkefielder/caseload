require 'rails_helper'

describe 'Navigating sessions' do

  it 'allows navigation from the detail page to the listing page' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)

    visit student_session_url(student, session)

    click_link 'Cancel'

    expect(current_path).to eq(student_sessions_path(session))
  end

  it 'allows navigation from the listing page to the detail page' do
    student = Student.create(student_attributes)
    session = student.sessions.create(session_attributes)
    visit student_sessions_url(student, session)

    click_link session.date

    expect(current_path).to eq(student_session_path(student, session))
  end
end
