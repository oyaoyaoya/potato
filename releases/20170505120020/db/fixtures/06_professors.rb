require "csv"
@i = 0
# 全カリ
professor_csv = CSV.read('db/csv/professors/p_01_00-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 1
    s.department_id = 1
    @i+= 1
  end
end
# 文学部
# キリスト教学科
# 文学科英米文学専修
# 文学科ドイツ文学専修
# 文学科フランス文学専修
# 文学科日本文学専修
# 文学科文芸・思想専修
# 史学科

# 文学部キリスト教学科
professor_csv = CSV.read('db/csv/professors/p_02_01-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 2
    @i += 1
  end
end

# 文学部文学科英米文学専修

professor_csv = CSV.read('db/csv/professors/p_02_02-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 3
    @i += 1
  end
end

# 文学部文学科ドイツ文学専修
professor_csv = CSV.read('db/csv/professors/p_02_03-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 4
    @i += 1
  end
end

# 文学部文学科ドイツ文学専修
professor_csv = CSV.read('db/csv/professors/p_02_04-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 5
    @i += 1
  end
end

# 文学部文学科ドイツ文学専修
professor_csv = CSV.read('db/csv/professors/p_02_05-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 6
    @i += 1
  end
end

# 文学部文学科ドイツ文学専修
professor_csv = CSV.read('db/csv/professors/p_02_06-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 7
    @i += 1
  end
end

# 文学部文学科ドイツ文学専修
professor_csv = CSV.read('db/csv/professors/p_02_07-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 8
    @i += 1
  end
end

# 文学部文学科ドイツ文学専修
professor_csv = CSV.read('db/csv/professors/p_02_08-1.csv')
professor_csv.each.with_index do |row|
  professor_name = row[0]

  Professor.seed do |s|
    s.id = @i
    s.name = professor_name
    s.school_id = 1
    s.faculty_id = 2
    s.department_id = 9
    @i += 1
  end
end
