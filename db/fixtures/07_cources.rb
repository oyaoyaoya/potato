(1...99).each do |i|
  g = i % 30
  d = Department.find(g)
  ff = d.faculty_id
  e = d.name
  Course.seed do |c|
   c.id = i
   c.name  ="#{e}入門"
   c.professor_id = g
   c.text_presence = 0
   c.day = 0
   c.period = 0
  end
  DepartmentAndCourse.seed do |cd|
    cd.id = i
    cd.course_id = i
    cd.department_id = g
  end
  FacultyAndCourse.seed do |cf|
    cf.id = i
    cf.course_id = i
    cf.faculty_id = ff
  end
end
