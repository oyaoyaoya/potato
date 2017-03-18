require "csv"

# 学科
source_department_csv = CSV.read('db/fixtures/source_department.csv')
source_department_csv.each.with_index(1) do |row, i|
  source_department_name = row[0]
  faculty_id = row[1]

  SourceDepartment.seed do |s|
    s.id = i
    s.name = source_department_name
  end
end
