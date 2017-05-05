(1...99).each do |i|
  d_id = i % 30
  d_id = d_id + 1
  d = Department.find(d_id)
  f_id = d.faculty_id
  User.seed do |u|
    u.id = i
    u.email = "#{i}@rikkyo.ac.jp"
    u.password = 'valid_password'
    u.password_confirmation = 'valid_password'
    u.school_id = 1
    u.department_id = d_id
    u.faculty_id = f_id
    u.name = Faker::Name.name
  end
end
