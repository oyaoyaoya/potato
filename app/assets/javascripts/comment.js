function buildComment(message){
  var html =  $(
    "<li class='collection-item avatar'>" +
      "<img class='circle' src='/assets/icon-5a0ec8f539e852da35cce90032f0fb1a67dd1dc4028ab2909ba48ba4740af9a6.png' alt='Icon'>" +
      "<span class='title'>" + message.user_name + "</span>" +
      "<p>" + message.body +
      "</p>"+
    "</li>"
    )
    return html
};

$(function(){
  $('#comment_form').on('submit', function(e){
    e.preventDefault();
    var $comment_field = $('#comment_field');
    var comment_body = $comment_field.val();
    var i_id =　$("#item_id").val();
    var url = $(this)[0].action
    $.ajax({
      url: url,
      type: 'POST',
      data: {
        comment: {
          body: comment_body,
          item_id: i_id
        }
      },
      dataType: 'json',
    })
    .done(function(data){
      comment = buildComment(data);
      $('.comments_ul').append(comment);
      $comment_field.val('');
    })
    .fail(function(a,b,c){
      alert("please reload");
    });
    return false;
  });
});
