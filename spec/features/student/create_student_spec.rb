require 'rails_helper'

describe 'Creating a new student' do
  it "saves the student and shows the new student's details" do
    visit students_url

    click_link 'Add Student'

    expect(current_path).to eq(new_student_path)

    fill_in 'First name', with: 'Bob'
    fill_in 'Last name', with: 'Marley'
    check 'student_triennial'
    fill_in 'student_min_hours', with: '1500'
    fill_in 'Iep date', with: '1984-05-06'
    fill_in 'Date of birth', with: '1983-05-30'
    fill_in 'Grade', with: '8'
    fill_in 'Diagnosis', with: 'Articulation'

    click_button 'Create Student'

    expect(current_path).to eq(student_path(Student.last))

    expect(page).to have_text('Bob Marley')
    expect(page).to have_text('Articulation')
    expect(page).to have_text('1500')
    expect(page).to have_text('1984-05-06')
    expect(page).to have_text('8')
  end
end
