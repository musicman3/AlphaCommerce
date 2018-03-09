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
  if ($osC_MessageStack->size('login') > 0) {
    echo $osC_MessageStack->get('login');
  }
?>

<div class="moduleBox" style="width: 49%; float: right;">
  <form name="login" action="<?php echo osc_href_link(FILENAME_ACCOUNT, 'login=process', 'SSL'); ?>" method="post">

  <h6><?php echo $osC_Language->get('login_returning_customer_heading'); ?></h6>

  <div class="content">
    <p><?php echo $osC_Language->get('login_returning_customer_text'); ?></p>

    <ol>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_email_address'), 'email_address') . osc_draw_input_field('email_address'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_password'), 'password') . osc_draw_password_field('password'); ?></li>
    </ol>

    <p><?php echo sprintf($osC_Language->get('login_returning_customer_password_forgotten'), osc_href_link(FILENAME_ACCOUNT, 'password_forgotten', 'SSL')); ?></p>

    <p style="text-align: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('icon' => 'key', 'title' => $osC_Language->get('button_sign_in'))); ?></p>
  </div>

  </form>
</div>

<div class="moduleBox" style="width: 49%;">
  <div class="outsideHeading">
    <h6><?php echo $osC_Language->get('login_new_customer_heading'); ?></h6>
  </div>

  <div class="content">
    <p><?php echo $osC_Language->get('login_new_customer_text'); ?></p>

    <p style="text-align: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, 'create', 'SSL'), 'icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?></p>
  </div>
</div>
