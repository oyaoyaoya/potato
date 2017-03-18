(1...99).each do |i|
  d_id = i % 32
  d = Department.find(d_id)
  f_id = d.faculty_id
  User.seed do |u|
    u.id = i
    u.email = "#{i}@rikkyo.ac.jp"
    u.password = 'valid_password'
    u.password_confirmation = 'valid_password'
    u.school_id = 0
    u.department_id = d_id
    u.faculty_id = f_id
    u.name = Faker::Name.name
  end
end
