(function () {
    $.ajax({
        url: 'controller/exam/current-exam.php',
        type: 'get',
        success: function (data) {
            if (data.statusCode == 200) {
                let exam = data.content;
                $('#ce_join').attr('href',`index.php?module=examination&act=do-exam&id=${exam.id}`)
                $('#ce_thumbnail').attr('src',exam.thumbnail);
                $('#ce_thumbnail').attr('alt',exam.title);
                $('#ce_regulation').attr('data-regulation',exam.regulation);
                $('#ce_regulation').attr('data-title',exam.title);
                const second = 1000,
                    minute = second * 60,
                    hour = minute * 60,
                    day = hour * 24;
                let birthday = exam.end,
                
                    countDown = new Date(birthday).getTime(),
                    x = setInterval(function () {
                        let now = new Date().getTime(),
                            distance = countDown - now;
                        document.getElementById("days").innerText = (String(Math.floor((distance / (day)))).charAt(1)) ? String(Math.floor((distance / (day)))).charAt(0) : 0,
                            document.getElementById("days1").innerText = (String(Math.floor((distance / (day)))).charAt(1)) ? String(Math.floor((distance / (day)))).charAt(1) : String(Math.floor((distance / (day)))).charAt(0),
                            document.getElementById("hours").innerText = (String(Math.floor((distance % (day)) / (hour))).charAt(1)) ? String(Math.floor((distance % (day)) / (hour))).charAt(0) : 0,
                            document.getElementById("hours1").innerText = (String(Math.floor((distance % (day)) / (hour))).charAt(1)) ? String(Math.floor((distance % (day)) / (hour))).charAt(1) : String(Math.floor((distance % (day)) / (hour))).charAt(0),
                            document.getElementById("minutes").innerText = (String(Math.floor((distance % (hour)) / (minute))).charAt(1)) ? String(Math.floor((distance % (hour)) / (minute))).charAt(0) : 0,
                            document.getElementById("minutes1").innerText = (String(Math.floor((distance % (hour)) / (minute))).charAt(1)) ? String(Math.floor((distance % (hour)) / (minute))).charAt(1) : String(Math.floor((distance % (hour)) / (minute))).charAt(0),
                            document.getElementById("seconds").innerText = (String(Math.floor((distance % (minute)) / second)).charAt(1)) ? String(Math.floor((distance % (minute)) / second)).charAt(0) : 0,
                            document.getElementById("seconds1").innerText = (String(Math.floor((distance % (minute)) / second)).charAt(1)) ? String(Math.floor((distance % (minute)) / second)).charAt(1) : String(Math.floor((distance % (minute)) / second)).charAt(0);

                        //do something later when date is reached
                        if (distance < 0) {
                            let headline = document.getElementById("headline"),
                                countdown = document.getElementById("countdown"),
                                content = document.getElementById("content");

                            headline.innerText = "It's my birthday!";
                            countdown.style.display = "none";
                            content.style.display = "block";

                            clearInterval(x);
                        }
                        //seconds
                    }, 0)
            }
        }
    })

}());

$('#ce_regulation').click(function(e){
    e.preventDefault();
    let regulation = $(this).data('regulation');
    let title = $(this).data('title');
    Swal.fire({
        title: `<strong>${title.toUpperCase()}</strong>`,
        html: regulation,
        customClass: 'swal-wide',
        showCloseButton: true,
        showCancelButton: false,
        focusConfirm: false,
        closeButtonText: '<i class="fa fa-thumbs-up"></i> Great!',
       
      })
})