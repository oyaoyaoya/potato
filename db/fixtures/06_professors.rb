require "csv"

professor_csv = CSV.read('db/fixtures/professor.csv')
professor_csv.each.with_index do |row, i|
  professor_name = row[0]
  department_id = row[1]
  f = Department.find(department_id)

  Professor.seed do |s|
    s.id = i
    s.name = professor_name
    s.department_id = department_id
    s.school_id = 0
    if department_id == 0
      s.faculty_id = 0
    else
      s.faculty_id = 1
    end
  end
end
