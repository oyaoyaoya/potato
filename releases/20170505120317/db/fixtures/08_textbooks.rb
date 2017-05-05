require "csv"

# 学部
textbook_csv = CSV.read('db/csv/completed/textbook.csv')
first_line = textbook_csv[0]
colum_num = first_line.count
textbook_csv.each.with_index do |row, i|
  unless i == 0
    s = Textbook.new do |s|
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
