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
?>

<h1><?php echo osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()), $osC_Template->getPageTitle()); ?></h1>

<?php
  if ($osC_MessageStack->size($osC_Template->getModule()) > 0) {
    echo $osC_MessageStack->get($osC_Template->getModule());
  }
?>

<div class="infoBoxHeading"><?php echo osc_icon('trash.png') . ' ' . $osC_Language->get('action_heading_batch_delete_feature'); ?></div>
<div class="infoBoxContent">
  <form name="mDeleteBatch" action="<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&page=' . $_GET['page'] . '&action=batchDelete'); ?>" method="post">

  <p><?php echo $osC_Language->get('introduction_batch_delete_feature'); ?></p>

<?php
  $Qfeatures = $osC_Database->query('select f.feature_id, pd.products_name from :table_feature f, :table_products_description pd where f.feature_id in (":feature_id") and f.products_id = pd.products_id and pd.language_id = :language_id order by pd.products_name');
  $Qfeatures->bindTable(':table_feature', TABLE_FEATURE);
  $Qfeatures->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
  $Qfeatures->bindRaw(':feature_id', implode('", "', array_unique(array_filter(array_slice($_POST['batch'], 0, MAX_DISPLAY_SEARCH_RESULTS), 'is_numeric'))));
  $Qfeatures->bindInt(':language_id', $osC_Language->getID());
  $Qfeatures->execute();

  $names_string = '';

  while ( $Qfeatures->next() ) {
    $names_string .= osc_draw_hidden_field('batch[]', $Qfeatures->valueInt('feature_id')) . '<b>' . $Qfeatures->valueProtected('products_name') . '</b>, ';
  }

  if ( !empty($names_string) ) {
    $names_string = substr($names_string, 0, -2);
  }

  echo '<p>' . $names_string . '</p>';
?>

  <p align="center"><?php echo osc_draw_hidden_field('subaction', 'confirm') . '<input type="submit" value="' . $osC_Language->get('button_delete') . '" class="operationButton" /> <input type="button" value="' . $osC_Language->get('button_cancel') . '" onclick="document.location.href=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&page=' . $_GET['page']) . '\';" class="operationButton" />'; ?></p>

  </form>
</div>
