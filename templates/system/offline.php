<?php
/*

  osCommerce, Open Source E-Commerce Solutions
  http://www.rubicshop.ru

  Copyright (c) 2009 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $osC_Language->getTextDirection(); ?>" xml:lang="<?php echo $osC_Language->getCode(); ?>" lang="<?php echo $osC_Language->getCode(); ?>">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo $osC_Language->getCharacterSet(); ?>" />
    <meta http-equiv="x-ua-compatible" content="ie=9" />
    <title><?php echo STORE_NAME; ?></title>

    <base href="<?php echo osc_href_link(null, null, 'AUTO', false); ?>" />


    <link rel="stylesheet" type="text/css" href="templates/system/stylesheet.css" />

    <meta name="Generator" content="RuBiC" />  

  </head>
  <body id="offline">
    <div id="pageContent">
      
      <div class="content">
        <img src= "<?php echo osc_href_link('images/store_logo.jpg', '', '', false, false, true); ?>"/> 
        <h1><?php echo STORE_NAME; ?></h1>
        
        <p><?php echo $osC_Language->get('introduction_mode_text'); ?></p>
	<p><h5><?php echo $osC_Language->get('box_languages_heading'); ?></h5>
				<?php foreach ($osC_Language->getAll() as $value) { echo osc_link_object(osc_href_link(basename($_SERVER['SCRIPT_FILENAME']), osc_get_all_get_params(array('language', 'currency')) . '&language=' . $value['code'], 'AUTO'), $osC_Language->showImage($value['code'])) . ' '; } ?></p>
        
      </div>
    </div>
  </body>
</html>