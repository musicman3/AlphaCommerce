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

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<?php
  if ($osC_MessageStack->size('account_password') > 0) {
    echo $osC_MessageStack->get('account_password');
  }
?>

<form name="account_password" action="<?php echo osc_href_link(FILENAME_ACCOUNT, 'password=save', 'SSL'); ?>" method="post" onsubmit="return check_form(account_password);">

<div class="moduleBox">
  <em style="float: right; margin-top: 10px;"><?php echo $osC_Language->get('form_required_information'); ?></em>

  <h6><?php echo $osC_Language->get('my_password_title'); ?></h6>

  <div class="content">
    <ol>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_password_current'), 'password_current', null, true) . osc_draw_password_field('password_current'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_password_new'), 'password_new', null, true) . osc_draw_password_field('password_new'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_password_confirmation'), 'password_confirmation', null, true) . osc_draw_password_field('password_confirmation'); ?></li>
    </ol>
  </div>
</div>

<div class="submitFormButtons">
  <span style="float: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?></span>

  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, null, 'SSL'), 'icon' => 'triangle-1-w', 'title' => $osC_Language->get('button_back'))); ?>
</div>

</form>
