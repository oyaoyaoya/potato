$(function(){
    $('#department_form').on('change', function(){
        var department_value = $('#department_form option:selected').val();
        $('#user_department_id').val(department_value);
    });
});
