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

<?php
  if ($osC_MessageStack->size('contact') > 0) {
    echo $osC_MessageStack->get('contact');
  }

  if (isset($_GET['contact']) && ($_GET['contact'] == 'success')) {
?>

<p><?php echo $osC_Language->get('contact_email_sent_successfully'); ?></p>

<div class="submitFormButtons" style="text-align: right;">
  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_INFO), 'icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?>
</div>

<?php
  } else {
?>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('contact_title'); ?></h6>

  <div class="content">
    <div style="float: right; padding: 0px 0px 10px 20px;">
      <?php echo nl2br(STORE_NAME_ADDRESS); ?>
    </div>

    <div style="float: right; padding: 0px 0px 10px 20px; text-align: center;">
      <?php echo '<b>' . $osC_Language->get('contact_store_address_title') . '</b><br />' . osc_image('templates/' . $osC_Template->getCode() . '/images/arrow_south_east.png'); ?>
    </div>

    <p style="margin-top: 0px;"><?php echo $osC_Language->get('contact'); ?></p>

    <div style="clear: both;"></div>
  </div>
</div>

<form name="contact" action="<?php echo osc_href_link(FILENAME_INFO, 'contact=process'); ?>" method="post">

<div class="moduleBox">
  <div class="content">
    <ol>
      <li><?php echo osc_draw_label($osC_Language->get('contact_name_title'), 'name') . osc_draw_input_field('name'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('contact_email_address_title'), 'email') . osc_draw_input_field('email'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('contact_enquiry_title'), 'enquiry') . osc_draw_textarea_field('enquiry', null, 50, 15); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('contact_code_title'), 'concat_code') . osc_draw_input_field('concat_code', '', 'size="27"'); ?></li> 
      <li><img src="<?php echo FILENAME_INFO?>?contact=showImage" alt="Captcha" /></li>
    </ol>
  </div>
</div>

<div class="submitFormButtons" style="text-align: right;">
  <?php echo $osC_Template->osc_draw_image_jquery_button(array('icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_send'))); ?>
</div>

</form>

<?php
  }
?>
