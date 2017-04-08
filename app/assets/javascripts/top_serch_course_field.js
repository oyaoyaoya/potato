function removeElement2(){
  var hoge = $('#search-results2').children();
  $('.Search_course__text_field__wrap').css('margin', '0 12px')
  $('#course_result2').children().remove();
  $('#search_course_field2').val("");
}

$(function(){
  $('#search_course_field2').on('focus', function(){
    $('.Search_course__text_field__wrap').css('margin', '0')
  });
  $('#search_course_field2').on('blur', function(){
     setTimeout(removeElement2, 700);
  });
});
