module UsersHelper
  def message_tag(contract)
    message = contract.messages.last
    content_string = ''.html_safe
    if message == nil
      content_string << content_tag( :span, "", class:"new badge")
    else
      if message.user_id == current_user.id
        content_string << content_tag( :span, "済み", class:"badge")
      else
        content_string << content_tag( :span, "", class:"new badge")
      end
    end
    return content_string
  end
end
