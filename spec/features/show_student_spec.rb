require 'rails_helper'

describe 'Viewing an individual student' do
  it 'shows the student details' do
    student = Student.create(student_attributes)

    visit student_url(student)

    expect(page).to have_text(student.first_name)
    expect(page).to have_text(student.last_name)
    expect(page).to have_text(student.iep_date)
    expect(page).to have_text(student.triennial)
    expect(page).to have_text(student.min_hours)
    expect(page).to have_text(student.age)
    expect(page).to have_text(student.grade)
    expect(page).to have_text(student.diagnosis)
    expect(page).to have_text(student.dismissed)
  end
end
