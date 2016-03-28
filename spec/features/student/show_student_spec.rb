require 'rails_helper'

describe 'Viewing an individual student with tri and dismissed' do
  it 'shows the student details' do
    student = Student.create(student_attributes)

    visit student_url(student)

    expect(page).to have_text(student.first_name)
    expect(page).to have_text(student.last_name)
    expect(page).to have_text(student.iep_date.strftime('%F'))
    expect(page).to have_css('i.fi-check')
    expect(page).to have_text(student.min_hours)
    expect(page).to have_text(student.years_old(student.age))
    expect(page).to have_text(student.grade)
    expect(page).to have_text(student.diagnosis)
    expect(page).to have_css('i.fi-check')
  end
end

describe 'Viewing an individual student that does not have a tri' do
  it 'shows the prohibited symbol' do
    student = Student.create(student_attributes)
    student.triennial = false
    student.save

    visit student_url(student)

    expect(page).to have_css('i.fi-prohibited')
  end
end
