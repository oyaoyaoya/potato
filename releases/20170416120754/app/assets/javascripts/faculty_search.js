$(function(){
  $('#school_form').on('change', function(){
      var school_value = $('#school_form option:selected').val();
      console.log(school_value)
     $.ajax({
          type: 'GET',
          url: '/users/faculty_select',
          data: {
              school_id: school_value
          }
      }).done(function(data){
          console.log(data)
         $('#faculty_id').html(data).material_select();
      })
  })
})