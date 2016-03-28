require 'rails_helper'

describe 'Viewing a list of session notes' do
  it 'shows the session notes for a specific student' do
    student1 = Student.create(student_attributes(first_name: 'Jimbo'))
    note1 = student1.sessions.create(session_attributes(date: '2016-01-01'))
    note2 = student1.sessions.create(session_attributes(date: '2015-11-02'))

    student2 = Student.create(student_attributes(first_name: 'Clark'))
    note3 = student2.sessions.create(session_attributes(date: '2013-02-01'))

    visit student_sessions_url(student1)

    expect(page).to have_text(note1.date.strftime('%F'))
    expect(page).to have_text(note2.date.strftime('%F'))
    expect(page).not_to have_text(note3.date)
  end
end
