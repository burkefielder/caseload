def student_attributes(overrides = {})
  {
    first_name:  'John',
    last_name:   'Doe',
    triennial:   true,
    iep_date:    '2016-04-21',
    min_hours:   15
  }.merge(overrides)
end
