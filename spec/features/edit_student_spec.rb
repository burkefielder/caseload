require 'rails_helper'

describe 'Editing an individual student' do
  it 'updates the student details and shows the updated details' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'Edit'

    expect(current_path).to eq(edit_student_path(student))
    expect(find_field('First name').value).to eq(student.first_name)
    expect(find_field('Last name').value).to eq(student.last_name)
    expect(find('input[type=checkbox]').value).to eq '1'
    expect(find_field('Iep date').value).to eq(student.iep_date.strftime('%F'))
    expect(find('input[type=number]').value).to eq(student.min_hours.to_s)
  end
end
