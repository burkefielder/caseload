require 'rails_helper'

describe 'Editing an individual student' do

  it 'shows the student details' do
    student = Student.create(student_attributes)

    visit edit_student_url(student)

    expect(page).to have_text(student.first_name)
    expect(page).to have_text(student.last_name)
    expect(page).to have_text('Triennial due')
    expect(page).to have_text('Iep date')
    expect(page).to have_text('IEP Minutes')
  end
end
