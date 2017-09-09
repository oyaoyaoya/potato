$(function(){
    $('#faculty_form').on('change', function(){
        var faculty_value = $('#faculty_form option:selected').val();
        $.ajax({
            type: 'GET',
            url: '/users/department_select',
            data: {
                faculty_id: faculty_value
            }
        }).done(function(data){
            $('#department_id').html(data).material_select();
            $('#user_faculty_id').val(faculty_value)
        })
    })
})
