<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/
?>

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<div class="moduleBox" style="width: 40%; float: right; margin: 0 0 10px 10px;">
  <h6><?php echo $osC_Language->get('cookie_usage_box_heading'); ?></h6>

  <div class="content">
    <?php echo $osC_Language->get('cookie_usage_box_contents'); ?>
  </div>
</div>

<p><?php echo $osC_Language->get('cookie_usage'); ?></p>

<div class="submitFormButtons" style="text-align: right;">
  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_INFO), 'icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?>
</div>
