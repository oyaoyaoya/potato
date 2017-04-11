class TextInfo < ApplicationRecord
  require 'open-uri'
  require 'pry-rails'
  # Nokogiriライブラリの読み込み
  require 'nokogiri'
  require "csv"
  require 'google/apis/books_v1'
  Books = Google::Apis::BooksV1

  # スクレイピング先のURL
  # def self.food
  #   files = Dir.glob("db/csv/links/*")
  #   files.each do |file|
  #     course_csv = CSV.read(file)
  #     course_csv.each.with_index do |row|
  #       name = row[0]
  #       if name == "2年次演習1" || name == "2年次演習2" || name == "3年次演習1" || name == "3年次演習2" || name == "卒論演習1" || name == "卒論演習2"
  #         puts name
  #       end
  #     end
  #   end
  # end
  @@read_num = 0
  @@text_num = 0
  @@text_fairule_num = 0
  @@not_text_course_num = 0

  def self.food
    array = []
    array << TextInfo.last.course_id
    array << Textbook.last.course_id
    last_course_id = array.sort.last
    courses = Course.where('id > ?', last_course_id)
    courses.each do |course|
      if TextInfo.find_by(course_id: course.id) == nil && Textbook.find_by(course_id: course.id) == nil
        url = "https://sy.rikkyo.ac.jp#{course.url}"
        charset = nil
        html = open(url) do |f|
          charset = f.charset # 文字種別を取得
          f.read # htmlを読み込んで変数htmlに渡す
        end
        # htmlをパース(解析)してオブジェクトを生成
        doc = Nokogiri::HTML.parse(html, nil, charset)
        f = doc.xpath('//*[@id="form"]/div[3]/table/tr[11]/td[3]')
        d = f.inner_text
        info = d.strip
        if info.length > 500
          x = 4
          until doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[2]").inner_text.strip == ""
            author = doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[2]").inner_text.strip
            title = doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[3]").inner_text.strip
            publisher = doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[4]").inner_text.strip
            published_year = doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[5]").inner_text.strip
            isbn = doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[6]").inner_text.strip
            url = doc.xpath("//*[@id='form']/div[3]/table/tr[11]/td[3]/table/tr[#{x}]/td[6]/a/@href").inner_text.strip
            textbook = Textbook.new(name: title, course_id: course.id, author: author, publisher: publisher, published_year: published_year, book_code: isbn, url: url)
            if textbook.save
              puts "done"
              puts "教科書を保存しました。"
              @@text_num += 1
            else
              textinfo = TextInfo.new(name: course.name, info: info, course_id: course.id)
              textinfo.save
              puts "教科書を保存できませんでした。"
              @@text_fairule_num += 1
            end
            x = x + 2
            puts "教科書が存在する授業です"
          end
        else
          info  = info.gsub(/[\r\n]/,"")
          info_length = info.length
          info_byte = info.bytesize
          info_lines = info.lines
          text_info = TextInfo.new(name: course.name, info: info, course_id: course.id)
          text_info.save
          course = Course.find(course.id)
          course.update(text_presence: 1)
          puts "教科書が存在しない授業です"
          @@not_text_course_num += 1
        end
      else
        puts "既に存在しています。"
      end
      @@read_num += 1
    end
    puts @@read_num
    puts @@text_num
    puts @@text_fairule_num
    puts @@not_text_course_num
  end

  def self.google
    require 'google/apis/books_v1'
    servise = Books::Metadata.new
    puts "hage"
  end
end
