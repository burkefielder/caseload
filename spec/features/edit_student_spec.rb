require 'rails_helper'

describe 'Editing an individual student' do

  it 'shows the student details' do
    student = Student.create(student_attributes)

    visit edit_student_url(student)

    expect(page).to have_text(student.first_name)
    expect(page).to have_text(student.last_name)
    expect(page).to have_text('Iep date')
    expect(student.triennial).to eq true
    expect(student.min_hours).to eq 15.0
  end
end
