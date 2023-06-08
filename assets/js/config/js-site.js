$(function(){
    $.ajax({
        url:'controller/config/list.php',
        type:'get',
        data:{
            mod:'GLOBAL',
            fnc:'BASIC'
        },
        success:function(data){
            if(data.statusCode == 200){
                data.content.forEach(c=>{
                    $(`#${c.cf_key.toLowerCase()}`).text(c.cf_value);
                })
            }
        }
    })
})