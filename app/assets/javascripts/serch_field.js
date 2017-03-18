$(function(){
  $('#serch_course_field').on('focus', function(){
    $('.search-wrapper').css('margin', '0')
  });
  $('#serch_course_field').on('blur', function(){
    $('.search-wrapper').css('margin', '0 12px');
    $('#course_result').children().remove();
  });
});
