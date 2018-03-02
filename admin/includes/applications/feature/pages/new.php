<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  $feature_array = array();

  $Qfeatures = $osC_Database->query('select p.products_id, pd.products_name, f.feature_date_added from :table_products p left join :table_feature f on (p.products_id = f.products_id), :table_products_description pd where p.products_id = pd.products_id and pd.language_id = :language_id order by pd.products_name');
  $Qfeatures->bindTable(':table_products', TABLE_PRODUCTS);
  $Qfeatures->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
  $Qfeatures->bindTable(':table_feature', TABLE_FEATURE);
  $Qfeatures->bindInt(':language_id', $osC_Language->getID());
  $Qfeatures->execute();
  
    while ( $Qfeatures->next() ) {
    	if ( $Qfeatures->value('feature_date_added') < 1 ) {
      $feature_array[] = array('id' => $Qfeatures->valueInt('products_id'),
                                'text' => $Qfeatures->value('products_name'));
    	}
  }

?>

<h1><?php echo osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()), $osC_Template->getPageTitle()); ?></h1>

<?php
  if ($osC_MessageStack->size($osC_Template->getModule()) > 0) {
    echo $osC_MessageStack->get($osC_Template->getModule());
  }
?>

<div class="infoBoxHeading"><?php echo osc_icon('new.png') . ' ' . $osC_Language->get('action_heading_new_feature'); ?></div>
<div class="infoBoxContent">
  <form name="feature" action="<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&page=' . $_GET['page'] . '&action=save'); ?>" method="post">

  <p><?php echo $osC_Language->get('introduction_new_feature'); ?></p>

  <p><?php echo '<b>' . $osC_Language->get('field_product') . '</b><br />' . osc_draw_pull_down_menu('products_id', $feature_array); ?></p>
  <p><?php echo '<b>' . $osC_Language->get('field_status') . '</b><br />' . osc_draw_checkbox_field('feature_status', '1'); ?></p>
  <p><?php echo '<b>' . $osC_Language->get('field_date_start') . '</b><br />' . osc_draw_input_field('feature_start_date'); ?></p>
  <p><?php echo '<b>' . $osC_Language->get('field_date_expires') . '</b><br />' . osc_draw_input_field('feature_expires_date'); ?></p>

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
