require "csv"

# 学部
source_faculty_csv = CSV.read('db/fixtures/source_faculty.csv')
source_faculty_csv.each.with_index(1) do |row, i|
  source_faculty_name = row[0]

  SourceFaculty.seed do |s|
    s.id = i
    s.name = source_faculty_name
  end
end
