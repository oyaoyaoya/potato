require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
require "csv"

# スクレイピング先のURL

files = Dir.glob("db/csv/links/*")
files.each do |file|
  course_csv = CSV.read(file)
  course_csv.each.with_index do |row|
    url = row[0]
    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを生成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    d = doc.xpath('//div[3]')
    e = d.xpath('//tr[11]')


    f = doc.xpath('//*[@id="form"]/div[3]/table/tr[11]/td[3]')
    d = f.inner_text
    puts d.strip
  end
end
