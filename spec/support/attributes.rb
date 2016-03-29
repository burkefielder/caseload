def student_attributes(overrides = {})
  {
    first_name: 'John',
    last_name:  'Doe',
    triennial:   true,
    iep_date:   '2016-04-21',
    min_hours:   15,
    age:        '2010-01-01',
    grade:       1,
    diagnosis:  'social language',
    dismissed:   true
  }.merge(overrides)
end

def session_attributes(overrides = {})
  {
    date: '2016-03-01',
    minutes: 30,
    notes: 'Billy was totally uncooperative.',
    therapy: 'traditional artic'
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: 'Example User',
    email: 'user@example.com',
    password: 'secret',
    password_confirmation: 'secret'
  }.merge(overrides)
end
