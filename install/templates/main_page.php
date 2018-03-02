<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2009 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  $template = 'main_page';
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=<?php echo $osC_Language->getCharacterSet(); ?>" />

<title>RuBiC (Online Shopping), Open Source E-Commerce Solutions</title>

<meta name="robots" content="noindex,nofollow">

<link rel="stylesheet" type="text/css" href="templates/main_page/stylesheet.css">

<link rel="stylesheet" type="text/css" href="ext/niftycorners/niftyCorners.css">
<script type="text/javascript" src="ext/niftycorners/nifty.js"></script>

</head>

<body>

<div id="pageHeader">
  <div>
    <div style="float: right; padding-top: 28px; padding-right: 15px; color: #ffffff; font-weight: bold;"><a href="http://www.rubicshop.ru" target="_blank">RuBiC Website</a> &nbsp;|&nbsp; <a href="http://www.oscommerce.com" target="_blank">osCommerce Website</a></div>

    <a href="index.php"><img src="images/install_logo.png" border="0" width="133" height="46" title="RuBiC (Online Shopping)" style="margin: 0px 0px 0px 10px;" /></a>
  </div>
</div>

<script type="text/javascript">
<!--
  if (NiftyCheck()) {
    Rounded("div#pageHeader", "all", "#FFFFFF", "#0E517D", "smooth border #0E517D");
  }
//-->
</script>

<div id="pageContent">
<?php require('templates/pages/' . $page_contents); ?>
</div>

<div id="pageFooter">
  Copyright &copy; 2009-<?php echo date ("Y") ?> <a href="http://www.rubicshop.ru" target="_blank">RuBiC (Online Shopping)</a><br />RuBiC (Online Shopping) provides no warranty and is redistributable under the <a href="http://www.fsf.org/licenses/gpl.txt" target="_blank">GNU General Public License v2 (1991)</a>
</div>

</body>

</html>
