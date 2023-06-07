<?php

/**
 * Created by OANH.
 * User: Administrator
 * Date: 1/21/2016
 * Time: 7:32 PM
 */
if (isset($_GET['a']) && $_GET['a'] == "getID") {
    $url = $_GET['data'];
    parse_str(parse_url($url, PHP_URL_QUERY), $MyArray);
    $idVideo = $MyArray["v"];
    echo $idVideo;
}

?>
