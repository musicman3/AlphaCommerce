<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/
?>

<?php if (file_exists('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage()) == true) {
echo osc_image('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo$osC_Template->getPageTitle(); ?></h1>

<?php
  if ($osC_MessageStack->size('account') > 0) {
    echo $osC_MessageStack->get('account');
  }
?>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('my_account_title'); ?></h6>

  <div class="content">
    <?php echo osc_image('templates/' . $osC_Template->getCode() . '/images/account_personal.gif', $osC_Language->get('my_account_title'), null, null); ?>

    <ul style="padding-left: 100px; list-style-image: url(<?php echo osc_href_link('templates/' . $osC_Template->getCode() . '/images/arrow_green.gif', null, 'SSL'); ?>);">
      <li><?php echo osc_link_object(osc_href_link(FILENAME_ACCOUNT, 'edit', 'SSL'), $osC_Language->get('my_account_information')); ?></li>
      <li><?php echo osc_link_object(osc_href_link(FILENAME_ACCOUNT, 'address_book', 'SSL'), $osC_Language->get('my_account_address_book')); ?></li>
      <li><?php echo osc_link_object(osc_href_link(FILENAME_ACCOUNT, 'password', 'SSL'), $osC_Language->get('my_account_password')); ?></li>
    </ul>

    <div style="clear: both;"></div>
  </div>
</div>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('my_orders_title'); ?></h6>

  <div class="content">
    <?php echo osc_image('templates/' . $osC_Template->getCode() . '/images/account_orders.gif', $osC_Language->get('my_orders_title'), null, null); ?>

    <ul style="padding-left: 100px; list-style-image: url(<?php echo osc_href_link('templates/' . $osC_Template->getCode() . '/images/arrow_green.gif', null, 'SSL'); ?>);">
      <li><?php echo osc_link_object(osc_href_link(FILENAME_ACCOUNT, 'orders', 'SSL'), $osC_Language->get('my_orders_view')); ?></li>
    </ul>

    <div style="clear: both;"></div>
  </div>
</div>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('my_notifications_title'); ?></h6>

  <div class="content">
    <?php echo osc_image('templates/' . $osC_Template->getCode() . '/images/account_notifications.gif', $osC_Language->get('my_notifications_title'), null, null); ?>

    <ul style="padding-left: 100px; list-style-image: url(<?php echo osc_href_link('templates/' . $osC_Template->getCode() . '/images/arrow_green.gif', null, 'SSL'); ?>);">
      <li><?php echo osc_link_object(osc_href_link(FILENAME_ACCOUNT, 'newsletters', 'SSL'), $osC_Language->get('my_notifications_newsletters')); ?></li>
      <li><?php echo osc_link_object(osc_href_link(FILENAME_ACCOUNT, 'notifications', 'SSL'), $osC_Language->get('my_notifications_products')); ?></li>
    </ul>

    <div style="clear: both;"></div>
  </div>
</div>
