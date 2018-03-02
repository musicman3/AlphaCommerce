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

  $Qfeature = osC_Feature::getListing();
?>

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<div style="overflow: auto;">

<?php
  while ($Qfeature->next()) {
  	$feature = new osC_Product($Qfeature->valueInt('products_id'));
    echo '<span style="width: 33%; float: left; text-align: center;">';

      echo osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qfeature->value('products_keyword')), $osC_Image->show($Qfeature->value('image'), $Qfeature->value('products_name'))) . '<br />' .
                             osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qfeature->value('products_keyword')), $Qfeature->value('products_name')) . '<br />' .
                             $feature->getPriceFormated(true) .
         '<br /><br /></span>' . "\n";
  }
?>

</div>

<div class="listingPageLinks">
  <span style="float: right;"><?php echo $Qfeature->getBatchPageLinks('page', 'feature'); ?></span>

  <?php echo $Qfeature->getBatchTotalPages($osC_Language->get('result_set_number_of_products')); ?>
</div>
