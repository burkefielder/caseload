require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'has many notes' do
    student = Student.new(student_attributes)

    note1 = student.sessions.new(session_attributes)
    note2 = student.sessions.new(session_attributes)

    expect(student.sessions).to include(note1)
    expect(student.sessions).to include(note2)
  end

  it 'deletes associated sessions' do
    student = Student.create(student_attributes)

    student.sessions.create(session_attributes)

    expect {
      student.destroy
    }.to change(Session, :count).by(-1)
  end
end
