$(function(){
    LoadProvincesWithWorkplaces();
})

function LoadProvincesWithWorkplaces(){
    $.ajax({
        url:'controller/location/provinces-workplaces.php',
        type:'get',
        success:function(data){
            console.log(data);
        }
    })
}