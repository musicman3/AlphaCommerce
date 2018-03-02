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
  $QinfoList = $osC_Database->query('select * from :table_info where language_id = :language_id and info_id = "2"');
  $QinfoList->bindTable(':table_info', TABLE_INFO);
  $QinfoList->bindInt(':language_id', $osC_Language->getID());
  $QinfoList->execute();
?>

	<!-- Start LicenceBox -->
	<script type="text/javascript" src="ext/jquery/jquery.colorbox.min.js"></script>
	<link rel="stylesheet" type="text/css" href="templates/<?php echo $osC_Template->getCode(); ?>/colorbox_license.css" />
	<script type="text/javascript">
		$(document).ready(function(){
			$(".license").colorbox({maxWidth:"60%", maxHeight:"95%", inline:true, href:"#inline_example1"});
		});
	</script>
	<div style='display:none'>
		<div id='inline_example1' align="justify" style='padding:10px; background:#fff;'>
			<?php echo $QinfoList->value("info_description"); ?>
		</div>
	</div>
	<!-- End LicenceBox -->

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<?php
  if ($osC_MessageStack->size('create') > 0) {
    echo $osC_MessageStack->get('create');
  }
?>

<form name="create" action="<?php echo osc_href_link(FILENAME_ACCOUNT, 'create=save', 'SSL'); ?>" method="post" onsubmit="return check_form(create);">

<div class="moduleBox">
  <em style="float: right; margin-top: 10px;"><?php echo $osC_Language->get('form_required_information'); ?></em>

  <h6><?php echo $osC_Language->get('my_account_title'); ?></h6>

  <div class="content">
    <ol>

<?php
  if (ACCOUNT_GENDER > -1) {
    $gender_array = array(array('id' => 'm', 'text' => $osC_Language->get('gender_male')),
                          array('id' => 'f', 'text' => $osC_Language->get('gender_female')));
?>

      <li><?php echo osc_draw_label($osC_Language->get('field_customer_gender'), 'fake', null, (ACCOUNT_GENDER > 0)) . osc_draw_radio_field('gender', $gender_array); ?></li>

<?php
  }
?>

      <li><?php echo osc_draw_label($osC_Language->get('field_customer_last_name'), 'lastname', null, true) . osc_draw_input_field('lastname'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_first_name'), 'firstname', null, true) . osc_draw_input_field('firstname'); ?></li>

<?php
  if (ACCOUNT_DATE_OF_BIRTH == '1') {
?>

      <li><?php echo osc_draw_label($osC_Language->get('field_customer_date_of_birth'), 'dob_days', null, true) . osc_draw_date_pull_down_menu('dob', null, false, null, null, date('Y')-1901, -5); ?></li>

<?php
  }
?>

      <li><?php echo osc_draw_label($osC_Language->get('field_customer_email_address'), 'email_address', null, true) . osc_draw_input_field('email_address'); ?></li>

<?php
  if (ACCOUNT_NEWSLETTER == '1') {
?>

      <li><?php echo osc_draw_label($osC_Language->get('field_customer_newsletter'), 'newsletter') . osc_draw_checkbox_field('newsletter', '1', '1'); ?></li>

<?php
  }
?>

      <li><?php echo osc_draw_label($osC_Language->get('field_customer_password'), 'password', null, true) . osc_draw_password_field('password'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_customer_password_confirmation'), 'confirmation', null, true) . osc_draw_password_field('confirmation'); ?></li>
    </ol>
  </div>
</div>

<?php
  if (DISPLAY_PRIVACY_CONDITIONS == '1') {
?>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('create_account_terms_heading'); ?></h6>

  <div class="content">
    <?php echo sprintf($osC_Language->get('create_account_terms_description'), osc_href_link(FILENAME_INFO, 'view=1', 'AUTO').'" class="license"') . '<br /><br /><ol><li>' . osc_draw_checkbox_field('privacy_conditions', array(array('id' => 1, 'text' => $osC_Language->get('create_account_terms_confirm')))) . '</li></ol><br />'; ?>
  </div>
</div>

<?php
  }
?>

<div class="submitFormButtons">
  <span style="float: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?></span>

  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, null, 'SSL'), 'icon' => 'triangle-1-w', 'title' => $osC_Language->get('button_back'))); ?>
</div>

</form>
