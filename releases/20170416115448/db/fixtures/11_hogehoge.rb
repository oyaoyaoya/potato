require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
require "csv"

@i = Course.last.id + 1
files = Dir.glob("db/csv/courses/*")

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

# def seminar_words
#   [ "演習1", "演習2", "演習3",  "ゼミナール　Ｂ", "ゼミナール　A", "演習 A", "演習 B", "卒業論文(制作)･卒業論文(制作)指導演習", "研究小論文", "卒業論文(制作)予備演習", "教育実践研究", "数学講究", "応用数学講究", "卒業研究", "化学実験　４", "輪講", "卒業論文演", "研究1", "研究2"]
# end

# def seminar_words
#   [ "演習 B", "卒業論文(制作)･卒業論文(制作)指導演習", "研究小論文", "卒業論文(制作)予備演習", "教育実践研究", "数学講究", "応用数学講究", "卒業研究", "化学実験　４", "輪講", "卒業論文演", "研究1", "研究2", "演習（２年）", "演習（３年)", "演習（４年）", "卒業論文" ]
# end
# def seminar_words
#   ["演習（４年）Ａ","演習（４年）Ｂ","演習（２年）Ａ","演習（２年）Ｂ","演習（３年）Ａ","演習（３年）Ｂ", "卒業論文" ]
# end
def seminar_words
  ["卒業論文指導演習２", "	卒業論文指導演習１"]
end

def get_course(file)
  info_array = process_file(file)
  split_code(info_array)
  @year = info_array[0]
  @school_id = info_array[1]
  @faculty_id = info_array[2]
  @department_id = info_array[3]
  @count = 0
  course_csv = CSV.read(file)
  course_csv.each.with_index do |row|
    course_num = row[0]
    "#{@faculty_id}:#{@department_id}:#{@i}"if course_num == ""
    name = row[1]
    professor_name = row[2]
    if seminar_words.include?(name)
      name = "#{professor_name}: #{name}"
    end

    info = row[3]
    term = info[0,1]
    day = info[2,1]
    period = info[4,1]

    term = return_term(term)
    day = return_day(day)
    period = return_period(period)

    url = row[4]

    c = Course.find_by(name: name, faculty_id: @faculty_id)
    if c == nil
      course = Course.new(
        id: @i,
        name: name,
        course_num: course_num,
        professor_name: professor_name,
        term: term,
        period: period,
        day: day,
        info: info,
        hold_year: @year,
        school_id: @school_id,
        faculty_id: @faculty_id,
        department_id: @department_id,
        url: url
        )
        if course.save
          puts course
          @i += 1
        else
          puts "failed save"
        end
    end
  end
end

files.each do |file|
  scv_presence = CsvCounter.find_by(name: file)
  if scv_presence == nil
    puts "読み込み開始"
    get_course(file)
    puts "読み込み完了"
    CsvCounter.create(name: file, csv_type: "course")
  else
    puts "読み込み済み"
  end
end
