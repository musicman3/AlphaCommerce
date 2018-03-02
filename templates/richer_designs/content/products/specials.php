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

  $Qspecials = osC_Specials::getListing();
?>

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<div style="overflow: auto;">

<?php
  while ($Qspecials->next()) {
    echo '<span style="width: 33%; float: left; text-align: center;">';

      echo osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qspecials->value('products_keyword')), $osC_Image->show($Qspecials->value('image'), $Qspecials->value('products_name'))) . '<br />';
    
    echo osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qspecials->value('products_keyword')), $Qspecials->value('products_name')) . '<br />' .
         '<span style="text-decoration: line-through;">' . $osC_Currencies->displayPrice($Qspecials->value('products_price'), $Qspecials->valueInt('products_tax_class_id')) . '</span><br /><span class="productSpecialPrice">' . $osC_Currencies->displayPrice($Qspecials->value('specials_new_products_price'), $Qspecials->valueInt('products_tax_class_id')) . '<br /><br /></span>' .
         '</span>' . "\n";
  }
?>

</div>

<div class="listingPageLinks">
  <span style="float: right;"><?php echo $Qspecials->getBatchPageLinks('page', 'specials'); ?></span>

  <?php echo $Qspecials->getBatchTotalPages($osC_Language->get('result_set_number_of_products')); ?>
</div>
