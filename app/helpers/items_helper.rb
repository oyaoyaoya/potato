module ItemsHelper
  def item_tag(item)
    content_string = ''.html_safe
    t = Time.now
    if item.contract == true
      content_string << content_tag( :span, "SoldOut", class:" gray badge")
    else
      if t - 7.days <= item.created_at
      content_string << content_tag( :span, "", class:"new badge", "data-badge-caption" => "新着")
      else
        content_string << content_tag( :span, "", class:"new blue badge", "data-badge-caption" => "購入可能")
      end
    end
    return content_string
  end
  def item_link(item)
  end
end
