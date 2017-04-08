module CoursesHelper
  def back_link(course)
    content = "".html_safe
    if controller.controller_name == "courses" && controller.action_name == "show"
      content << content_tag(:a,"学部授業一覧", href:"/courses", class:"back_link waves-effect waves-light btn white blue-text text-darken-2")
    else
      content << content_tag(:a,"授業詳細", href: "courses/#{course.id}", class:"back_link waves-effect waves-light btn white blue-text text-darken-2")
    end
  end
end
