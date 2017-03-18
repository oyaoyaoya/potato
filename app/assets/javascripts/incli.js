$(function(){
    var preFunc = null
    var preInput = ''
    var input = ''

    //インクリメンタルサーチ開始
    $('#user-text-field').on('keyup', function() {
        input = $.trim($(this).val());
        if(preInput !== input){
            clearTimeout(preFunc);
            preFunc = setTimeout(function(){
                $.ajax({
                    url: "search",
                    type: "GET",
                    data: ("name=" + input),
                    dataType: 'json',
                    timeout: 1000
                })
                    .done(function(data){
                        $('#user_add_ul').children().remove();
                        $.each(data, function(){
                            user = biuildUsers(this)
                            $('#user_add_ul').append(user);
                        });
                    })
                    .fail(function(data){
                        alert('please reload page');
                    });
                return false
            }, 500);
            preInput = input;
        }
    });
    //ユーザーの削除機能
    $( document ).on( 'click', '.user_remove_list--link', function(e) {
        awesomeUser(e,$(this))
    });
    //ユーザーの追加機能
    $( document ).on( 'click', '.user_add_list--link', function(e) {
        awesomeUser(e,$(this))
    });
});
