require 'rails_helper'

describe 'Viewing an individual student' do
  it 'shows the student details' do
    student = Student.create(student_attributes)

    visit student_url(student)

    expect(find_field('First name').value).to eq(student.first_name)
    expect(find_field('Last name').value).to eq(student.last_name)
    expect(find('input[type=checkbox]').value).to eq '1'
    expect(find_field('Iep date').value).to eq(student.iep_date.strftime('%F'))
    expect(find('input[type=number]').value).to eq(student.min_hours.to_s)
    expect(find('age').value).to eq(student.age)
    expect(find('grade').value).to eq '1'
    expect(find('diagnosis').value).to eq(student.diagnosis)
    expect(find('dismissed').value).to eq 'false'
  end
end
