require "csv"

@i = Course.last.id

def split_code(array)
  array.map{|f| f.slice!(0) if f.chr == "0"}
end

def process_file(file)
  department_code_array = file.delete("/[a-z]/.-").split("_")
  department_code_array
end

def return_day(day)
  return 0 if day == "月"
  return 1 if day == "火"
  return 2 if day == "水"
  return 3 if day == "木"
  return 4 if day == "金"
  return 5 if day == "土"
  return 6
end

def return_period(period)
  return 0 if period == "１"
  return 1 if period == "２"
  return 2 if period == "３"
  return 3 if period == "４"
  return 4 if period == "５"
  return 5 if period == "６"
  return 6 if period == "７"
  return 7
end

def return_term(term)
  return 0 if term == "春"
  return 1 if term == "秋"
  return 2 if term == "通年"
  return 3
end

files = Dir.glob("db/csv/courses/*")

files.each do |file|
  scv_presence = CsvCounter.find_by(name: file)
  if scv_presence == nil
    読み込み開始
  else
    読み込みスキップ
  end
  course_csv.fist
  info_array = process_file(file)
  split_code(info_array)
  @year = info_array[0]
  @school_id = info_array[1]
  @faculty_id = info_array[2]
  @department_id = info_array[3]
  course_csv = CSV.read(file)
  course_csv = CSV.read(file)

  # course_csv.each.with_index do |row|
  #   course_num = row[0]
  #   name = row[1]
  #   professor_name = row[2]
  #   if name.include?("演習1") || name.include?("演習2")
  #     name = "#{professor_name}:#{name}"
  #   end
  #   if name.include?("ゼミナール　Ｂ") || name.include?("ゼミナール　Ａ")
  #     name = "#{professor_name}:#{name}"
  #   end
  #   info = row[3]
  #   url = row[4]
  #   term = info[0,1]
  #   day = info[2,1]
  #   period = info[4,1]
  #   term = return_term(term)
  #   day = return_day(day)
  #   period = return_period(period)
  #   c = Course.find_by(name: name)
  #   if c == nil
  #     Course.seed do |s|
  #       s.id = @i
  #       s.name = name
  #       s.course_num = course_num
  #       s.professor_name = professor_name
  #       s.term = term
  #       s.period = period
  #       s.day = day
  #       s.info = info
  #       s.hold_year = @year
  #       s.school_id = @school_id
  #       s.faculty_id = @faculty_id
  #       s.department_id = @department_id
  #       s.url = url
  #       @i+= 1
  #     end
  #   end
  # end
end
