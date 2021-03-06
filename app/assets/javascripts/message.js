function buildHTML(message){
  var html = $(
    "<li class='message_li_body right-msg right-align'>" +
      message.body +
    "</li>")
    return html
};

$(function(){
  $('#message_form').on('submit', function(e){
    e.preventDefault();
    var $message_field = $('#message_field')
    var message_body = $message_field.val();
    var c_id =　$('#message_contract_id').val();
    $.ajax({
      url: '/message',
      type: 'POST',
      data: {
        message: {
          body: message_body,
          contract_id: c_id
        }
      },
      dataType: 'json',
      timeout: 3000
    })
    .done(function(data){
      message = buildHTML(data);
      $('#message_ul').append(message);
      $message_field.val('');
    })
    .fail(function(a,b,c){
      alert("please reload");
    });
    return false;
  });
});
