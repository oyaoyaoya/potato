$(function(){
  $('#university_form').on('change', function(){
      var university_value = $('#university_form option:selected').val();
     $.ajax({
          type: 'GET',
          url: '/users/faculty_select',
          data: {
              university_id: university_value
          }
      }).done(function(data){
         $('#faculty_id').html(data).material_select();
      })
  })
})
