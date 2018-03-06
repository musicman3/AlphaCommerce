<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.

  RuBiC modding (http://www.rubicshop.ru)
*/

  class osC_Content_xsell_products extends osC_Modules {
    var $_title,
		$_code = 'xsell_products',
		$_author_name = 'RuBiC (modding)',
		$_author_www = 'http://www.rubicshop.ru',
		$_group = 'content';

		/* Class constructor */

    function osC_Content_xsell_products() {
      global $osC_Language;

      /* must need languages xsell.xml in languages directory */
      $this->_title = $osC_Language->get('xsell_products_title');


    }

    function initialize() {
      global $osC_Database, $osC_Language, $osC_Product, $osC_Image, $osC_Template;

            if (isset($osC_Product)) {
        $XproductsList = $osC_Database->query('select p.products_id, p.products_price, pd.products_keyword, pd.products_name, i.image from :table_products_xsell px left join :table_products_images i on (px.products_xsell_id = i.products_id and i.default_flag = :default_flag), :table_products p, :table_products_description pd where px.products_xsell_id = p.products_id and p.products_id = pd.products_id and px.products_id = :products_id and p.products_status = 1 and pd.language_id = :language_id');
        $XproductsList->bindTable(':table_products_xsell', TABLE_PRODUCTS_XSELL);
        $XproductsList->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $XproductsList->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
        $XproductsList->bindTable(':table_products', TABLE_PRODUCTS);
        $XproductsList->bindInt(':default_flag', 1);
        $XproductsList->bindInt(':products_id', $osC_Product->getID());
        $XproductsList->bindInt(':language_id', $osC_Language->getID());
        $XproductsList->appendQuery('order by px.sort_order');
        $XproductsList->execute();
                                if ($XproductsList->numberOfRows()) {
                                    $i = 0;

				while ($XproductsList->next()) {
                                    if(($i % 3 == 0) && ($i != 0))
                                        $this->_content .= '<div style="clear: both; height: 15px;"></div>';
                                        $product = new osC_Product($XproductsList->valueInt('products_id'));
						if ( $osC_Product->hasVariants() ) {
					$this->_content .= '<div style="float:left; width: 33%;" align="center"><div class="productListing-data-image">' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $XproductsList->value('products_keyword')), $osC_Image->show($XproductsList->value('image'), $XproductsList->value('products_name'), null, 'thumbnails')) . '</div>';
                                        $this->_content .= '<div class="productListing-data-name">' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $XproductsList->value('products_keyword')), $XproductsList->value('products_name')) . '</div>';
                                        $this->_content .= '<div class="productListing-data-price">' . $product->getPriceFormated(true) . '</div>';
					$this->_content .= '<div class="productListing-data-buy">' . $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(basename($_SERVER['SCRIPT_FILENAME']), $XproductsList->value('products_keyword') . '&action=cart_add'), 'icon' => 'cart', 'title' => $osC_Language->get('button_buy_now'))) . '</div>';
					$this->_content .= '</div>';
                                                } else {
                			$this->_content .= '<div style="float:left; width: 33%;" align="center"><div class="productListing-data-image">' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $XproductsList->value('products_keyword')), $osC_Image->show($XproductsList->value('image'), $XproductsList->value('products_name'), null, 'thumbnails')) . '</div>';
                                        $this->_content .= '<div class="productListing-data-name">' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $XproductsList->value('products_keyword')), $XproductsList->value('products_name')) . '</div>';
                                        $this->_content .= '<div class="productListing-data-price">' . $product->getPriceFormated(true) . '</div>';
					$this->_content .= '<div class="productListing-data-buy">' . $osC_Template->osc_draw_image_jquery_button_buy(array('buy' => $XproductsList->value('products_keyword'), 'icon' => 'cart', 'title' => $osC_Language->get('button_buy_now'))) . '</div>';
					$this->_content .= '</div>';
                                                }
                                $i++;
                                }
                                $this->_content .= '<div style="clear:both"></div>';
                                }

            $XproductsList->freeResult();
            }
    }
  }
?>
