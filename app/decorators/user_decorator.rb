module UserDecorator
  def show_icon(id)
    case id
    when "0"
      image_tag "icon.jpg", size: "20×20"
    when "1"
      image_tag "hoshimo.png", size: "20×20"
    when "2"
      image_tag("dansyaku.jpg", :size => "20×20", class:"circle")
    when "3"
      image_tag "dansyaku.jpg", size: "20×20"
    when "4"
      image_tag "jagabata.png", size: "20×20"
    end
  end
end
