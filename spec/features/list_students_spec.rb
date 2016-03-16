require 'rails_helper'

describe 'Viewing the list of students' do
  it 'shows the students' do

    visit students_url

    expect(page).to have_text('My Caseload')
  end
end
