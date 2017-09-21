$(function(){
  $('#school_form').on('change', function(){
      var school_value = $('#school_form option:selected').val();
     $.ajax({
          type: 'GET',
          url: '/users/faculty_select',
          data: {
              school_id: school_value
          }
      }).done(function(data){
         $('#faculty_id').html(data).material_select();
      })
  })
})
