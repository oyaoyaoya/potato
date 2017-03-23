module ItemsHelper
  def item_tag(item)
    content_string = ''.html_safe
    if item.purchased == true
      content_string << content_tag( :span, "SoldOut", class:" gray badge")
    else
      content_string << content_tag( :span, "", class:"new badge", "data-badge-caption" => "購入可能")
    end
    content_string
  end

  def status_tag(item)
    content_string = ''.html_safe
    if item.purchased == true
      if item.contract.status == "completed"
        content_string << content_tag( :span, "", class:"new grey badge", "data-badge-caption" => "取引完了")
      else
        content_string << content_tag( :span, "", class:"new orange badge", "data-badge-caption" => "取引中")
      end
    else
      content_string << content_tag( :span, "", class:"new badge", "data-badge-caption" => "未購入")
    end
    content_string
  end

  def list_link(item)
    content_string = ''.html_safe
    if item.purchased == false
      content_string << %Q{<a href="/items/#{item.id}" class="collection-item">}.html_safe
    else
      content_string << %Q{<a href="/items/#{item.id}/contract" class="collection-item">}.html_safe
      # content_string << content_tag(:a, "", url:"item/#{item.id}/contract",  class:"collection-item") do
    end
    content_string
  end
end
