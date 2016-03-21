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
