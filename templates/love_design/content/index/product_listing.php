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
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<?php
// optional Product List Filter
  if (PRODUCT_LIST_FILTER > 0) {
    if (isset($_GET['manufacturers']) && !empty($_GET['manufacturers'])) {
      $filterlist_sql = "select distinct c.categories_id as id, cd.categories_name as name from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c, " . TABLE_CATEGORIES . " c, " . TABLE_CATEGORIES_DESCRIPTION . " cd, " . TABLE_TEMPLATES_BOXES . " tb, " . TABLE_PRODUCT_ATTRIBUTES . " pa where p.products_status = '1' and p.products_id = p2c.products_id and p2c.categories_id = c.categories_id and p2c.categories_id = cd.categories_id and cd.language_id = '" . (int)$osC_Language->getID() . "' and tb.code = 'manufacturers' and tb.id = pa.id and pa.products_id = p.products_id and pa.value = '" . (int)$_GET['manufacturers'] . "' order by cd.categories_name";
    } else {
      $filterlist_sql = "select distinct m.manufacturers_id as id, m.manufacturers_name as name from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_TO_CATEGORIES . " p2c, " . TABLE_MANUFACTURERS . " m where p.products_status = '1' and p.manufacturers_id = m.manufacturers_id and p.products_id = p2c.products_id and p2c.categories_id = '" . (int)$current_category_id . "' order by m.manufacturers_name";
    }

    $Qfilterlist = $osC_Database->query($filterlist_sql);
    $Qfilterlist->execute();

    if ($Qfilterlist->numberOfRows() > 1) {
      echo '<div class="productFilter"><p><form name="filter" action="' . osc_href_link(FILENAME_DEFAULT, null, 'NONSSL', false) . '" method="get">' . $osC_Language->get('filter_show') . '&nbsp;';
      if (isset($_GET['manufacturers']) && !empty($_GET['manufacturers'])) {
        echo osc_draw_hidden_field('manufacturers', $_GET['manufacturers']);
        $options = array(array('id' => '', 'text' => $osC_Language->get('filter_all_categories')));
      } else {
        echo osc_draw_hidden_field('cPath', $cPath);
        $options = array(array('id' => '', 'text' => $osC_Language->get('filter_all_manufacturers')));
      }

      if (isset($_GET['sort'])) {
        echo osc_draw_hidden_field('sort', $_GET['sort']);
      }

      while ($Qfilterlist->next()) {
        $options[] = array('id' => $Qfilterlist->valueInt('id'), 'text' => $Qfilterlist->value('name'));
      }
      echo osc_draw_pull_down_menu('filter', $options, (isset($_GET['filter']) ? $_GET['filter'] : null), 'onchange="this.form.submit()"');
      echo osc_draw_hidden_session_id_field() . '</form></p></div>' . "\n";
    }
  }

  if (isset($_GET['manufacturers']) && !empty($_GET['manufacturers'])) {
    $osC_Products->setManufacturer($_GET['manufacturers']);
  }

	if ((defined('PRODUCTS_LIST_GRID') && (PRODUCTS_LIST_GRID == '1') ? true : false)) {
	  $Qlisting = $osC_Products->execute();
	  require('includes/modules/product_griding.php');
	} else {
	  $Qlisting = $osC_Products->execute();
	  require('includes/modules/product_listing.php');
}
?>
