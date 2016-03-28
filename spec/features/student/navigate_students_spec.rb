require 'rails_helper'

describe 'Navigating students' do

  it 'allows navigation from the detail page to the listing page' do
    student = Student.create(student_attributes)

    visit student_url(student)

    click_link 'All Students'

    expect(current_path).to eq(root_path)
  end

  it 'allows navigation from the listing page to the detail page' do
    student = Student.create(student_attributes)
    visit students_url

    click_link 'Show Student'

    expect(current_path).to eq(student_path(student))
  end
end
