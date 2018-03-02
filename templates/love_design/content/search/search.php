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
			<?php echo $osC_Language->get('search_help'); ?>
		</div>
	</div>
	<!-- End LicenceBox -->

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<?php
  if ($osC_MessageStack->size('search') > 0) {
    echo $osC_MessageStack->get('search');
  }
?>

<form name="search" action="<?php echo osc_href_link(FILENAME_SEARCH, null, 'NONSSL', false); ?>" method="get" onsubmit="return check_form(this);">

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('search_criteria_title'); ?></h6>

  <div class="content">
    <?php echo osc_draw_input_field('keywords', null, 'style="width: 99%;"'); ?>
  </div>
</div>

<div class="submitFormButtons">
  <span style="float: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('icon' => 'search', 'title' => $osC_Language->get('button_search'))); ?></span>
<div class="license">
  <?php echo osc_link_object(osc_href_link(FILENAME_SEARCH, 'help'), $osC_Language->get('search_help_tips')); ?>
	</div>
</div>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('advanced_search_heading'); ?></h6>

  <div class="content">
    <ol>
      <li>

<?php
  echo osc_draw_label($osC_Language->get('field_search_categories'), 'category');

  $osC_CategoryTree->setSpacerString('&nbsp;', 2);

  $categories_array = array(array('id' => '', 'text' => $osC_Language->get('filter_all_categories')));

  foreach ($osC_CategoryTree->buildBranchArray(0) as $category) {
    $categories_array[] = array('id' => $category['id'],
                                'text' => $category['title']);
  }

  echo osc_draw_pull_down_menu('category', $categories_array);
?>

      </li>
      <li><?php echo osc_draw_checkbox_field('recursive', array(array('id' => '1', 'text' => $osC_Language->get('field_search_recursive'))), true); ?></li>
      <li>

<?php
  echo osc_draw_label($osC_Language->get('field_search_manufacturers'), 'manufacturer');

  $manufacturers_array = array(array('id' => '', 'text' => $osC_Language->get('filter_all_manufacturers')));

  $Qmanufacturers = $osC_Database->query('select manufacturers_id, manufacturers_name from :table_manufacturers order by manufacturers_name');
  $Qmanufacturers->bindTable(':table_manufacturers', TABLE_MANUFACTURERS);
  $Qmanufacturers->execute();

  while ($Qmanufacturers->next()) {
    $manufacturers_array[] = array('id' => $Qmanufacturers->valueInt('manufacturers_id'),
                                   'text' => $Qmanufacturers->value('manufacturers_name'));
  }

  echo osc_draw_pull_down_menu('manufacturer', $manufacturers_array);
?>

      </li>
      <li><?php echo osc_draw_label($osC_Language->get('field_search_price_from'), 'pfrom') . osc_draw_input_field('pfrom'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_search_price_to'), 'pto') . osc_draw_input_field('pto'); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_search_date_from'), 'datefrom') . osc_draw_date_pull_down_menu('datefrom', null, false, null, null, date('Y') - $osC_Search->getMinYear(), 0); ?></li>
      <li><?php echo osc_draw_label($osC_Language->get('field_search_date_to'), 'dateto') . osc_draw_date_pull_down_menu('dateto', null, null, null, null, date('Y') - $osC_Search->getMaxYear(), 0); ?></li>
    </ol>
  </div>
</div>

<?php
  echo osc_draw_hidden_session_id_field();
?>

</form>
