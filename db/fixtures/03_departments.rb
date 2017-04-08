require "csv"

# 学科
department_csv = CSV.read('db/fixtures/department.csv')
department_csv.each.with_index(1) do |row, i|
  department_name = row[0]
  school_id = row[1]
  faculty_id = row[2]

  Department.seed do |s|
    s.id = i
    s.name = department_name
    s.school_id = school_id
    s.faculty_id = faculty_id
  end
end
