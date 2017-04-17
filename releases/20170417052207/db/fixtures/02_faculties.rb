require "csv"

# 学部
faculty_csv = CSV.read('db/fixtures/faculty.csv')
faculty_csv.each.with_index(1) do |row, i|
  faculty_name = row[0]
  school_id = row[1]

  Faculty.seed do |s|
    s.id = i
    s.name = faculty_name
    s.school_id = row[1]
  end
end
