$(document).ready(function () {
    $('.modal').modal();
    $('.user_unlogin').on('click', function(){
      $('#user_modal').modal('open');
    })
});

$(function(){
    $('.modal_close-u').on('click', function(){
        $('#user_modal').modal('close');
    });
});
