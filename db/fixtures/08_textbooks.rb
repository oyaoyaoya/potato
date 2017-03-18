require 'faker'
Faker::Config.locale = :ja
(1...99).each do |i|
  text_price = [500, 1000, 1500, 2000]
  course = Course.find(i)
  course_name = course.name
  Textbook.seed do |t|
    t.id = i
    t.name = "#{course_name}の教科書"
    t.course_id = i
    t.price = text_price.sample
    t.explanation = Faker::Lorem.sentence
  end
end
