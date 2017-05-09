// function removeElement2(){
//   var hoge = $('#search-results2').children();
//   $('.Search_course__text_field__wrap').css('margin', '0 12px')
//   $('#course_result2').children().remove();
//   $('#search_course_field2').val("");
// }
//
// $(function(){
//   $('#search_course_field2').on('focus', function(){
//     $('.Search_course__text_field__wrap').css('margin', '0')
//   });
//   $('#search_course_field2').on('blur', function(){
//      setTimeout(removeElement2, 700);
//   });
// });

function buildCourse2(course){
    var html = $(`
      <div class="chip">
         <a href="/courses/${course.id}" class="">${course.name}</a>
      </div>
    `);
    return html
};

$(function() {
    $('#search_course_field2').val("");
    var preFunc = null
    var preInput = ''
    var input = ''
    //インクリメンタルサーチ開始
    $('#search_course_field2').on('keyup', function () {
        input = $.trim($(this).val());
        if(preInput !== input){
            clearTimeout(preFunc);
            preFunc = setTimeout(function(){
                $.ajax({
                    url: "/courses/search",
                    type: "GET",
                    scriptCharset: 'UTF-8',
                    data: ("name=" + input),
                    dataType: 'json',
                    timeout: 100000
                })
                    .done(function(data){
                        $('#course_result2').children().remove();
                        $.each(data, function(){
                            course = buildCourse2(this)
                            $('#course_result2').append(course);
                        })
                    })
                    .fail(function () {
                      alert("リロードしてください。")
                    });
                return false
            }, 500);
            preInput = input;
        }
    });
});
