require 'rails_helper'

describe 'Creating a new student' do
  it "saves the student and shows the new student's details" do
    visit students_url

    click_link 'Add Student to Caseload'

    expect(current_path).to eq(new_student_path)

    fill_in 'First name', with: 'Bob'
    fill_in 'Last name', with: 'Marley'
    check 'student_triennial'
    fill_in 'student_min_hours', with: '1500'
    fill_in 'Iep date', with: (Time.now.year - 1).to_s

    click_button 'Create Student'

    expect(current_path).to eq(student_path(Student.last))

    expect(page).to have_text('Bob Marley')
  end
end
