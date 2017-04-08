class Textbook < ApplicationRecord
  enum textbook_status: { published: 0, closed: 1 }
  has_many :items
  belongs_to :course
  # default_scope { where.not(textbook_status: "closed")} 

  include CsvExportable

  require 'net/http'
  require 'open-uri'
  require 'json'

  def self.search
    # coding: utf-8
    # スクレイピング先のURL
    require 'open-uri'
    require "uri"
    a = Textbook.where(textbook_status: "published")
    last_id = a.empty? ? "0" : "#{a.last.id}"
    @textbooks = Textbook.where('id > ?', last_id)
    @textbooks.each do |textbook|
      name = textbook.name
      publisher = textbook.publisher
      url = "https://www.googleapis.com/books/v1/volumes?q=#{name}?q=#{publisher}"
      new_url = URI.encode(url)
      open(new_url)
      res = open(new_url)
      code, message = res.status # res.status => ["200", "OK"]
      if code == '200'
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
end
