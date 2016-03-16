require 'rails_helper'

describe 'Navigating students' do

  it 'allows navigation from the detail page to the listing page' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'All students'

    expect(current_path).to eq(students_path)
  end

  it 'allows navigation from the listing page to the detail page' do
    student = Student.create(student_attributes)
    visit students_url

    click_link student.first_name

    expect(current_path).to eq(student_path(student))
  end
end
