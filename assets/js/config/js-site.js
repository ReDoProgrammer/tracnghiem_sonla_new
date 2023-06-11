$(function () {
    $.ajax({
        url: 'controller/config/list.php',
        type: 'get',
        data: {
            mod: 'GLOBAL',
            fnc: 'BASIC'
        },
        success: function (data) {
            if (data.statusCode == 200) {

                data.content.forEach(c => {
                    $(`span.${c.cf_key.toLowerCase()}`).text(c.cf_value);
                    $(`meta.${c.cf_key.toLowerCase()}`).attr('content', c.cf_value);
                    $(`title.${c.cf_key.toLowerCase()}`).text(c.cf_value);
                    $(`link.${c.cf_key.toLowerCase()}`).attr('href', c.cf_value);
                })
                let title = $("meta[class='site_name']").attr("content");
                let logo = data.content.filter(x => x.cf_key == 'SITE_LOGO')[0].cf_value;

                $(`img.site_logo`).attr('src', logo);
                $(`img.site_logo`).attr('alt', title);
                // $('span.site_logo').css("background-image", `url(${logo})`);

            }
        }
    })
})