require "csv"

# 学部
course_csv = CSV.read('db/csv/completed/course.csv')
first_line = course_csv[0]
colum_num = first_line.count
course_csv.each.with_index do |row, i|
  unless i == 0
    s = Course.new do |s|
      colum_num.times do |i|
        s[ first_line[i] ] = row[i]
      end
    end
    if s.save
      puts "save"
    else
      puts "failed"
    end
  end
end
