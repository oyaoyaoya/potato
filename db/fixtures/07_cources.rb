(1...99).each do |i|
  d = i % 30
  g = d + 1
  department = Department.find(g)
  faculty_id = department.faculty_id
  department_name = department.name
  Course.seed do |c|
   c.id = i
   c.name  ="#{department_name}入門"
   c.professor_id = g
   c.text_presence = 0
   c.school_id = 1
   c.faculty_id = faculty_id
   c.department_id = g
   c.day = 0
   c.period = 0
  end
end
