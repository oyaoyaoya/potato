class Textbook < ApplicationRecord
  enum textbook_status: { published: 0, closed: 1 }
  has_many :items
  belongs_to :course
  # default_scope { where.not(textbook_status: "closed")}


  include CsvExportable
  require 'csv'
  require 'net/http'
  require 'open-uri'
  require 'json'

  def self.get_url
    # coding: utf-8
    # スクレイピング先のURL
    require 'open-uri'
    require "uri"
    require 'csv'
    num = File.open("app/models/textbook_links/huga.csv", "r") do |file|
      file.read.to_i
    end
    @textbooks = Textbook.where('id > ?', num)
    @urls = CSV.read("app/models/textbook_links/hoge.csv")
    @textbooks.each.with_index(num) do |textbook, i|
      url = @urls[i][0]
      new_url = URI.encode(url)
      begin
      res = open(new_url)
      rescue
        sleep(120)
        res = open(new_url)
      end
      code, message = res.status # res.status => ["200", "OK"]
      if code == '200'
        File.open("app/models/textbook_links/huga.csv", 'w') do |file|
          file.write(i)
        end
        result = ""
        result = ActiveSupport::JSON.decode res.read
        # resultを使ってなんやかんや処理をする
        smallThumbnail = "none"
        thumbnail = "none"
        description = "none"
        infoLink = "none"
        isbn_10 = 0000
        isbn_13 = 0000
        unless result["items"] == nil
          base = result["items"][0]["volumeInfo"]
          unless base == nil
            unless base["imageLinks"] == nil
              unless base["imageLinks"]["smallThumbnail"] == nil
                smallThumbnail = result["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"]
              end
              unless base["imageLinks"]["thumbnail"] == nil
                thumbnail = result["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
              end
            end
            unless base["description"] == nil
              description = result["items"][0]["volumeInfo"]["description"]
            end
            unless base["infoLink"] == nil
              infoLink = result["items"][0]["volumeInfo"]["infoLink"]
            end
            unless base["industryIdentifiers"] == nil
              unless base["industryIdentifiers"][0] == nil
                isbn_10 = result["items"][0]["volumeInfo"]["industryIdentifiers"][0]["identifier"]
              end
              unless base["industryIdentifiers"][1] == nil
                isbn_13 = result["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"]
              end
            end
          end
        end
        if textbook.update(
          explanation: description,
          isbn_10: isbn_10,
          isbn_13: isbn_13,
          textbook_status: "published",
          small_thumbnail: smallThumbnail,
          thumbnail: thumbnail,
          info_link: infoLink
          )
        else
          puts "OMG!! #{code} #{message}"
          textbook.update(textbook_status: "closed")
        end
      else
        puts "OMG!! #{code} #{message}"
        textbook.update(textbook_status: "closed")
      end
      File.open("app/models/textbook_links/huga.csv", 'w') do |file|
        file.write(i)
      end
      sleep(1)
    end
  end

  def self.bookk
    textbooks = Textbook.all
    textbooks.each do |textbook|
      code = textbook.book_code.dump
      if code == "\"\\u{a0}\""
        textbook.update(book_code: "none")
      else
        code = code.gsub(/\D/, "")
        textbook.update(book_code: code)
      end
      puts textbook.book_code
    end
  end

  def generate_csv(textbook_links)

  end

  def self.correct_links
    textbook_links = []
    textbooks = Textbook.all
    textbooks.each do |textbook|
      book_code = textbook.book_code
      case book_code.length
      when 10
        url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{book_code}"
      when 11
        book_code.chop!
        url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{book_code}"
      when 13
        url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{book_code}"
      when 14
        book_code.chop!
        url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{book_code}"
      else
        url = "https://www.googleapis.com/books/v1/volumes?q=title:#{textbook.name}?q=authors:#{textbook.author}"
      end
      textbook_links << url
    end

    puts 'csvファイルを出力中・・・'

    csv_data = CSV.generate do |csv|
      textbook_links.each do |link|
        csv << [link]
      end
    end

    File.open("app/models/textbook_links/hoge.csv", 'a') do |file|
      file.write(csv_data)
    end
    puts 'csvファイルの出力完了しました。'
  end

  def self.output_csv
    csv_all = CSV.generate do |csv|
     csv << column_names
     all.each do |model|
       csv << model.attributes.values_at(*column_names)
     end
    end

    File.open("app/models/textbook_links/hage.csv", 'w') do |file|
      file.write(csv_all)
    end
  end

  def self.read_csv
    csv = CSV.table("app/models/textbook_links/hage.csv")
    csv.each do |csv|
      csv = csv.to_hash
      textbook = Textbook.find(csv[:id])
      textbook.update(csv)
      puts "done"
    end
  end

end
