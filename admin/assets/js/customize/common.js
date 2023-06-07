$(document).ready(function(){
    $.ajax({
        url:'controller/member/get-profile.php',
        type:'get',
        success:function(data){           
            if(data.statusCode !=200){
                Swal.fire({
                    icon: data.icon,
                    title: data.title,
                    text: data.content                   
                  })
                  $(location).prop('href', 'index.php?module=member&act=login')
            }else{
                let profile = data.content;

                $('p#userId').text(profile.fullname);
                $("p#userId").attr( "data-user", profile.id );


                $('li.user a img').attr('src',profile.avatar);
                $('li.user a span').text(profile.fullname);

                $('li ul.dropdown-menu li img').attr('src',profile.avatar);
                $('li ul.dropdown-menu li span').text(profile.fullname);
                let current = new Date();
                $('li ul.dropdown-menu li small').text(`
                ${current.getHours()<10?'0'+current.getHours():current.getHours()}:
                ${current.getMinutes()<10?'0'+current.getMinutes():current.getMinutes()}:
                ${current.getSeconds()<10?'0'+current.getSeconds():current.getSeconds()} | 
                ${current.getDay()<10?'0'+current.getDay():current.getDay()}/${current.getMonth()<10?'0'+current.getMonth():current.getMonth()}/${current.getFullYear()}`)
            }
        },
        error:function(err){
            console.log(err);
        }
    })
})