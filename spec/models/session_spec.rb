require 'rails_helper'

describe 'A therapy session' do
  it 'belongs to a student' do
    student = Student.create(student_attributes)

    session = student.sessions.new(session_attributes)

    expect(session.student).to eq(student)
  end

  it 'with example attributes is valid' do
    session = Session.new(session_attributes)

    expect(session.valid?).to eq(true)
  end

  it 'requires a date' do
    session = Session.new(date: '')

    session.valid? # populates errors

    expect(session.errors[:date].any?).to eq(true)
  end

  it 'requires a length of session' do
    session = Session.new(minutes: 0)

    session.valid?

    expect(session.errors[:minutes].any?).to eq(true)
  end

  it 'requires a note' do
    session = Session.new(notes: '')

    session.valid?

    expect(session.errors[:notes].any?).to eq(true)
  end

  it 'requires a note over 3 characters' do
    session = Session.new(notes: 'X' * 3)

    session.valid?

    expect(session.errors[:notes].any?).to eq(true)
  end
end
