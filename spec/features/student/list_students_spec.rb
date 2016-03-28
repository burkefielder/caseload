require 'rails_helper'

describe 'Viewing the list of students' do
  it 'shows the students' do
    student1 = Student.create(student_attributes)

    visit students_url
    expect(page).to have_text('John')
  end

  it 'does not show a student who has been dismissed'
    # student = Student.create(student_attributes(dismissed: true))
end
