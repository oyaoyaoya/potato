function removeElement(){
  var hoge = $('.search-results').children();
  $('.search-wrapper').css('margin', '0 12px')
  $('.search-results').children().remove();
  $('#search_course_field').val("");
}

$(function(){
  $('#search_course_field').on('focus', function(){
    $('.search-wrapper').css('margin', '0')
  });
  $('#search_course_field').on('blur', function(){
     setTimeout(removeElement, 700);
  });
});
