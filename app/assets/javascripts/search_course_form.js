function buildCourse(course){
    var html = "<a href='/courses/" + course.id + "'>" + course.name + "</a>";
    return html
};

$(function() {
    var preFunc = null
    var preInput = ''
    var input = ''
    //インクリメンタルサーチ開始
    $('#search_course_field').on('keyup', function () {
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
                    timeout: 1000
                })
                    .done(function(data){
                        $('#course_result').children().remove();
                        $.each(data, function(){
                            course = buildCourse(this)
                            $('#course_result').append(course);
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
