<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  $Qfeature = $osC_Database->query('select p.products_id, pd.products_name, f.expires_date, f.start_date, f.status from :table_feature f, :table_products p, :table_products_description pd where f.feature_id = :feature_id and f.products_id = p.products_id and p.products_id = pd.products_id and pd.language_id = :language_id');
  $Qfeature->bindTable(':table_feature', TABLE_FEATURE);
  $Qfeature->bindTable(':table_products', TABLE_PRODUCTS);
  $Qfeature->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
  $Qfeature->bindInt(':feature_id', $_GET['sID']);
  $Qfeature->bindInt(':language_id', $osC_Language->getID());
  $Qfeature->execute();

?>

<h1><?php echo osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()), $osC_Template->getPageTitle()); ?></h1>

<?php
  if ($osC_MessageStack->size($osC_Template->getModule()) > 0) {
    echo $osC_MessageStack->get($osC_Template->getModule());
  }
?>

<div class="infoBoxHeading"><?php echo osc_icon('edit.png') . ' ' . $Qfeature->value('products_name'); ?></div>
<div class="infoBoxContent">
  <form name="special" action="<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&page=' . $_GET['page'] . '&sID=' . $_GET['sID'] . '&action=save'); ?>" method="post">

  <p><?php echo $osC_Language->get('introduction_edit_feature'); ?></p>

  <p><?php echo '<b>' . $Qfeature->value('products_name') . '</b>' . osc_draw_hidden_field('products_id', $Qfeature->valueInt('products_id')); ?></p>
  <p><?php echo '<b>' . $osC_Language->get('field_status') . '</b><br />' . osc_draw_checkbox_field('feature_status', '1', $Qfeature->value('status')); ?></p>
  <p><?php echo '<b>' . $osC_Language->get('field_date_start') . '</b><br />' . osc_draw_input_field('feature_start_date', $Qfeature->value('start_date')); ?></p>
  <p><?php echo '<b>' . $osC_Language->get('field_date_expires') . '</b><br />' . osc_draw_input_field('feature_expires_date', $Qfeature->value('expires_date')); ?></p>

<script type="text/javascript"><!--

  $(function() {
    $("#feature_start_date").datepicker( {
      dateFormat: 'yy-mm-dd',
      changeMonth: true,
      changeYear: true
    } );

    $("#feature_expires_date").datepicker( {
      dateFormat: 'yy-mm-dd',
      changeMonth: true,
      changeYear: true
    } );
  });
//--></script>

  <p align="center"><?php echo osc_draw_hidden_field('subaction', 'confirm') . '<input type="submit" value="' . $osC_Language->get('button_save') . '" class="operationButton" /> <input type="button" value="' . $osC_Language->get('button_cancel') . '" onclick="document.location.href=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&page=' . $_GET['page']) . '\';" class="operationButton" />'; ?></p>

  </form>
</div>
