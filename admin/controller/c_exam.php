<?php

/**
 * @author ReDo
 * @copyright 2023
 */
if ((!$_SESSION['admin'])) {
  header('LOCATION: index.php?module=member&act=login');
  exit();
}
//G?i t?p tin giao di?n trong thu m?c view/theme/template tuong ?ng
include('model/m_exam.php');
$page = $_GET['act'];
switch ($page) {
  case 'list':
    require('view/template/exam/index.tpl');
    break;
  case 'history':
    require('view/template/exam/history.tpl');
    break;
  case 'history-detail':
    require('view/template/exam/history-detail.tpl');
    break;
  case 'report-statistic':
    require('view/template/exam/report-statistic.tpl');
    break;
}
