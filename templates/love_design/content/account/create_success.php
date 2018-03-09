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

  if ($osC_NavigationHistory->hasSnapshot()) {
    $origin_href = $osC_NavigationHistory->getSnapshotURL();
    $osC_NavigationHistory->resetSnapshot();
  } else {
    $origin_href = osc_href_link(FILENAME_DEFAULT);
  }
?>

<?php if (file_exists('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage()) == true) {
echo osc_image('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<div>
  <div style="float: left;"><?php echo osc_image('templates/' . $osC_Template->getCode() . '/images/table_background_man_on_board.png', $osC_Template->getPageTitle()); ?></div>

  <div style="padding-top: 30px;">
    <p><?php echo sprintf($osC_Language->get('success_account_created'), osc_href_link(FILENAME_INFO, 'contact')); ?></p>
  </div>
</div>

<div class="submitFormButtons" style="text-align: right;">
  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => $origin_href, 'icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?>
</div>
