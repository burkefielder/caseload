require 'rails_helper'

describe 'Editing an individual student' do
  it 'updates the student details' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'Edit'

    expect(current_path).to eq(edit_student_path(student))
    expect(find_field('First name').value).to eq(student.first_name)
    expect(find_field('Last name').value).to eq(student.last_name)
    expect(find('#student_age').value).to eq(student.age.strftime('%F'))
    expect(find('#student_grade').value).to eq(student.grade.to_s)
    expect(find('#student_triennial').value).to eq('1')
    expect(find_field('Iep date').value).to eq(student.iep_date.strftime('%F'))
    expect(find('#student_min_hours').value).to eq(student.min_hours.to_s)
    expect(find_field('Diagnosis').value).to eq(student.diagnosis)
    expect(find('#student_dismissed').value).to eq('1')
  end
  it 'shows the updated student details' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'Edit'

    fill_in 'Last name', with: 'Smith'

    click_button 'Update Student'

    expect(current_path).to eq(student_path(student))
    expect(page).to have_text('Smith')
    expect(page).to have_text('Student successfully updated!')
  end
end
