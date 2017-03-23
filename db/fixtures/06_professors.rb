require "csv"

professor_csv = CSV.read('db/fixtures/professor.csv')
professor_csv.each.with_index do |row, i|
  professor_name = row[0]
  faculty_id = row[1]
  department_id = row[2]


  Professor.seed do |s|
    s.id = i
    s.name = professor_name
    s.department_id = department_id
    s.school_id = 1
    s.faculty_id = faculty_id
    s.department_id = department_id
  end
end
