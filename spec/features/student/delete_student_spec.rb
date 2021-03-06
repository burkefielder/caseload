require 'rails_helper'

describe 'Deleting a student' do
  it 'destroys the student and shows the student listing
    without the deleted student' do
    student = Student.create(student_attributes)

    visit student_path(student)

    click_link 'Edit'
    click_link 'Delete Student'

    expect(current_path).to eq(students_path)
    expect(page).not_to have_text(student.first_name)
  end
end
