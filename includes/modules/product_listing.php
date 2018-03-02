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

// create column list
  $define_list = array('PRODUCT_LIST_MODEL' => PRODUCT_LIST_MODEL,
                       'PRODUCT_LIST_NAME' => PRODUCT_LIST_NAME,
                       'PRODUCT_LIST_MANUFACTURER' => PRODUCT_LIST_MANUFACTURER,
                       'PRODUCT_LIST_PRICE' => PRODUCT_LIST_PRICE,
                       'PRODUCT_LIST_QUANTITY' => PRODUCT_LIST_QUANTITY,
                       'PRODUCT_LIST_WEIGHT' => PRODUCT_LIST_WEIGHT,
                       'PRODUCT_LIST_IMAGE' => PRODUCT_LIST_IMAGE,
                       'PRODUCT_LIST_BUY_NOW' => PRODUCT_LIST_BUY_NOW);

  asort($define_list);

  $column_list = array();
  reset($define_list);
  while (list($key, $value) = each($define_list)) {
    if ($value > 0) $column_list[] = $key;
  }

  if ($Qlisting->numberOfRows() > 0) {
      $sortings = array();
      $list_headings = array();

    for ($col=0, $n=sizeof($column_list); $col<$n; $col++) {
      $lc_key = false;
      $lc_align = 'center';

      switch ($column_list[$col]) {
        case 'PRODUCT_LIST_MODEL':
          $lc_text = $osC_Language->get('listing_model_heading');
          $lc_key = 'model';
	  $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_NAME':
          $lc_text = $osC_Language->get('listing_products_heading');
          $lc_key = 'name';
	  $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_MANUFACTURER':
          $lc_text = $osC_Language->get('listing_manufacturer_heading');
          $lc_key = 'manufacturer';
	  $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_PRICE':
          $lc_text = $osC_Language->get('listing_price_heading');
          $lc_key = 'price';
          $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_QUANTITY':
          $lc_text = $osC_Language->get('listing_quantity_heading');
          $lc_key = 'quantity';
          $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_WEIGHT':
          $lc_text = $osC_Language->get('listing_weight_heading');
          $lc_key = 'weight';
          $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_IMAGE':
          $lc_text = $osC_Language->get('listing_image_heading');
          $lc_align = 'center';
          break;
        case 'PRODUCT_LIST_BUY_NOW':
          $lc_text = $osC_Language->get('listing_buy_now_heading');
          $lc_align = 'center';
          break;
      }

      $list_headings[] = array('lc_align' => $lc_align, 'lc_text' => $lc_text);
        
        if ($lc_key !== false) {
          // Put sortable field into array
          $sortings[] = array('id' => $lc_key, 'text' => $lc_text . ' ' . $osC_Language->get('listing_sort_ascendingly'));
          $sortings[] = array('id' => $lc_key . '|d', 'text' => $lc_text . ' ' . $osC_Language->get('listing_sort_descendingly'));
        }
      }
      
      if (!empty($sortings)) {
        $frm_sort = '<div class="productSort"><p>' .
        
        $frm_sort = '<form name="sort" action="' . osc_href_link(basename($_SERVER['SCRIPT_FILENAME']), null, 'NONSSL', false) . '" method="get">';
        $frm_sort .= $osC_Language->get('products_sort') . '&nbsp;';
        
        $params = explode('&', osc_get_all_get_params(array('page', 'sort')));
        foreach ($params as $key => $value) {
          $key_value = explode('=', $value);
          $frm_sort .= osc_draw_hidden_field($key_value[0], (isset($key_value[1]) ? $key_value[1] : ''));
        }
        
        $frm_sort .= osc_draw_pull_down_menu('sort', $sortings, 'name', ' onchange="this.form.submit()"');
        
        $frm_sort .= '</form>';
        $frm_sort .= '</p></div>';
        
        echo $frm_sort. "\n";
      }
?>
<div style="clear: both;"></div>
<?php      
  if ( ($Qlisting->numberOfRows() > MAX_DISPLAY_SEARCH_RESULTS) ||
       ( (PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3') ) ) {
?>
<div class="listingPageLinks">
  <span style="float: right;"><?php echo $Qlisting->getBatchPageLinks('page', osc_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></span>

      <?php echo $Qlisting->getBatchTotalPages($osC_Language->get('result_set_number_of_products')); ?>
</div>
<?php
  }
?>
<div>
  <table border="0" width="100%" cellspacing="0" cellpadding="2" id="productListing">
    <tr>
<?php      
        foreach($list_headings as $list_head) {
        echo '<td align="' . $list_head['lc_align'] . '" class="productListing-heading">&nbsp;' . $list_head['lc_text'] . '&nbsp;</td>' . "\n";
      }
?>

    </tr>

<?php
    $rows = 0;

    while ($Qlisting->next()) {
      $osC_Product = new osC_Product($Qlisting->valueInt('products_id'));

      $rows++;

      echo '    <tr class="' . ((($rows/2) == floor($rows/2)) ? 'productListing-even' : 'productListing-odd') . '">' . "\n";

      for ($col=0, $n=sizeof($column_list); $col<$n; $col++) {
        $lc_align = 'center';

        switch ($column_list[$col]) {
          case 'PRODUCT_LIST_MODEL':
            $lc_align = 'center';
            $lc_text = '&nbsp;' . $osC_Product->getModel() . '&nbsp;';
            break;
          case 'PRODUCT_LIST_NAME':
            $lc_align = 'center';
            if (isset($_GET['manufacturers'])) {
              $lc_text = osc_link_object(osc_href_link(FILENAME_PRODUCTS, $osC_Product->getKeyword() . '&manufacturers=' . $_GET['manufacturers']), $osC_Product->getTitle()) . '&nbsp;';
            } else {
              $lc_text = '&nbsp;' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $osC_Product->getKeyword() . ($cPath ? '&cPath=' . $cPath : '')), $osC_Product->getTitle()) . '&nbsp;';
            }
            break;
          case 'PRODUCT_LIST_MANUFACTURER':
            $lc_align = 'center';
            $lc_text = '&nbsp;';

            if ( $osC_Product->hasManufacturer() ) {
              $lc_text = '&nbsp;' . osc_link_object(osc_href_link(FILENAME_DEFAULT, 'manufacturers=' . $osC_Product->getManufacturerID()), $osC_Product->getManufacturer()) . '&nbsp;';
            }
            break;
          case 'PRODUCT_LIST_PRICE':
            $lc_align = 'center';
            $lc_text = '&nbsp;' . $osC_Product->getPriceFormated(true) . '&nbsp;';
            break;
          case 'PRODUCT_LIST_QUANTITY':
            $lc_align = 'center';
            $lc_text = '&nbsp;' . $osC_Product->getQuantity() . '&nbsp;';
            break;
          case 'PRODUCT_LIST_WEIGHT':
            $lc_align = 'center';
            $lc_text = '&nbsp;' . $osC_Product->getWeight() . '&nbsp;';
            break;
          case 'PRODUCT_LIST_IMAGE':
            $lc_align = 'center';
            if (isset($_GET['manufacturers'])) {
              $lc_text = osc_link_object(osc_href_link(FILENAME_PRODUCTS, $osC_Product->getKeyword() . '&manufacturers=' . $_GET['manufacturers']), $osC_Image->show($osC_Product->getImage(), $osC_Product->getTitle()));
            } else {
              $lc_text = '&nbsp;' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $osC_Product->getKeyword() . ($cPath ? '&cPath=' . $cPath : '')), $osC_Image->show($osC_Product->getImage(), $osC_Product->getTitle())) . '&nbsp;';
            }
            break;
          case 'PRODUCT_LIST_BUY_NOW':

			if ( $osC_Product->hasVariants() ) {
            $lc_align = 'center';
            $lc_text = $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(basename($_SERVER['SCRIPT_FILENAME']), $osC_Product->getKeyword() . '&' . osc_get_all_get_params(array('action')) . '&action=cart_add'), 'icon' => 'cart', 'title' => $osC_Language->get('button_buy_now')));
			
			}else{
            $lc_align = 'center';
            $lc_text = $osC_Template->osc_draw_image_jquery_button_buy(array('buy' => $osC_Product->getKeyword(), 'icon' => 'cart', 'title' => $osC_Language->get('button_buy_now')));
			}
            break;

        }

        echo '      <td ' . ((empty($lc_align) === false) ? 'align="' . $lc_align . '" ' : '') . 'class="productListing-data">' . $lc_text . '</td>' . "\n";
      }

      echo '    </tr>' . "\n";
    }
?>

  </table>
</div>
<?php
  } else {
    echo $osC_Language->get('no_products_in_category');
  }
?>

<?php
  if ( ($Qlisting->numberOfRows() > MAX_DISPLAY_SEARCH_RESULTS ) ||
       ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3')) ) {
?>

<div class="listingPageLinks">
  <span style="float: right;"><?php echo $Qlisting->getBatchPageLinks('page', osc_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></span>

  <?php echo $Qlisting->getBatchTotalPages($osC_Language->get('result_set_number_of_products')); ?>
</div>

<?php
  }
?>
