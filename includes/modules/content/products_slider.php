<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
  
  RuBiC production (http://www.rubicshop.ru)  
*/


  class osC_Content_products_slider extends osC_Modules {
    var $_title,
        $_code = 'products_slider',
        $_author_name = 'RuBiC',
        $_author_www = 'http://www.rubicshop.ru',
        $_group = 'content';

/* Class constructor */

    function osC_Content_products_slider() {
      global $osC_Language;

      $this->_title = $osC_Language->get('products_slider_title');
    }

    function initialize() {
      global $osC_Database, $osC_Services, $osC_Language, $osC_Currencies, $osC_Image, $osC_Specials, $current_category_id, $osC_Template;

      if (MODULE_CONTENT_PRODUCTS_SLIDER_PRODUCTS_TYPE == 'New Products') {
        $this->_title = $osC_Language->get('products_slider_new_products_title');
          $Qproducts = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd where p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id order by p.products_date_added desc limit :max_display_products');
      } else if (MODULE_CONTENT_PRODUCTS_SLIDER_PRODUCTS_TYPE == 'Best Sellers') {
        $this->_title = $osC_Language->get('products_slider_best_sellers_title');
          $Qproducts = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd where p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id and p.products_ordered > 0 order by p.products_ordered desc limit :max_display_products');
      } else if (MODULE_CONTENT_PRODUCTS_SLIDER_PRODUCTS_TYPE == 'Specials') {
        $this->_title = $osC_Language->get('products_slider_specials_title');
          $Qproducts = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, s.specials_new_products_price, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd, :table_specials s where s.status = 1 and s.products_id = p.products_id and p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id order by s.specials_date_added desc limit :max_display_products');
          $Qproducts->bindTable(':table_specials', TABLE_SPECIALS);
      } else if (MODULE_CONTENT_PRODUCTS_SLIDER_PRODUCTS_TYPE == 'Feature Products') {
        $this->_title = $osC_Language->get('products_slider_feature_title');
          $Qproducts = $osC_Database->query('select p.products_id, p.products_tax_class_id, p.products_price, pd.products_name, pd.products_keyword, i.image from :table_products p left join :table_products_images i on (p.products_id = i.products_id and i.default_flag = :default_flag), :table_products_description pd, :table_feature f where f.status = 1 and f.products_id = p.products_id and p.products_status = 1 and p.products_id = pd.products_id and pd.language_id = :language_id order by f.feature_date_added desc limit :max_display_products');
          $Qproducts->bindTable(':table_feature', TABLE_FEATURE);
      }

        $Qproducts->bindTable(':table_products', TABLE_PRODUCTS);
        $Qproducts->bindTable(':table_products_images', TABLE_PRODUCTS_IMAGES);
        $Qproducts->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
        $Qproducts->bindInt(':default_flag', 1);
        $Qproducts->bindInt(':language_id', $osC_Language->getID());
        $Qproducts->bindInt(':max_display_products', MODULE_CONTENT_PRODUCTS_SLIDER_MAX_DISPLAY);

        $Qproducts->execute();

	$this->_content =
              '<div class="jCarouselLite"><ul>' . "\n";

        while ($Qproducts->next()) {
          $product = new osC_Product($Qproducts->valueInt('products_id'));
          $this->_content .= '<li style="width:' . MODULE_CONTENT_PRODUCTS_SLIDER_SHOW_WIDTH . 'px; height:' . MODULE_CONTENT_PRODUCTS_SLIDER_SHOW_HEIGHT . 'px">' .
                             osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qproducts->value('products_keyword')), $osC_Image->show($Qproducts->value('image'), $Qproducts->value('products_name'))) . '<br />' .
                             osc_link_object(osc_href_link(FILENAME_PRODUCTS, $Qproducts->value('products_keyword')), $Qproducts->value('products_name')) . '<br />' .
                             $product->getPriceFormated(true) . '</li>';
     
        }

        $this->_content .=
              '</ul></div>' . "\n" .
            '<script type="text/javascript">
            $(".jCarouselLite").jCarouselLite({
    auto:' . MODULE_CONTENT_PRODUCTS_SLIDER_INTERVAL . ',
    speed:' . MODULE_CONTENT_PRODUCTS_SLIDER_SPEED . ',
    visible:' . MODULE_CONTENT_PRODUCTS_SLIDER_VISIBLE . ',
    scroll:' . MODULE_CONTENT_PRODUCTS_SLIDER_SCROLL . '
});
</script>'  . "\n";

      $Qproducts->freeResult();
    }

    function install() {
      global $osC_Database;

      parent::install();

      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function ,date_added) values ('Products type', 'MODULE_CONTENT_PRODUCTS_SLIDER_PRODUCTS_TYPE', 'New Products', 'The products type to be displayed in slider', '6', '0', 'osc_cfg_set_boolean_value(array(\'New Products\', \'Best Sellers\', \'Specials\', \'Feature Products\'))', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Interval (ms)', 'MODULE_CONTENT_PRODUCTS_SLIDER_INTERVAL', '3500', 'Slider interval', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Duration (ms)', 'MODULE_CONTENT_PRODUCTS_SLIDER_SPEED', '350', 'Slider duration', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Visible products (pcs.)', 'MODULE_CONTENT_PRODUCTS_SLIDER_VISIBLE', '1', 'Visible products', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Scroll products (pcs.)', 'MODULE_CONTENT_PRODUCTS_SLIDER_SCROLL', '1', 'Scroll products', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Max Display Products (pcs.) >= Visible products (pcs.)', 'MODULE_CONTENT_PRODUCTS_SLIDER_MAX_DISPLAY', '10', 'Max Display Products', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('The width of one block (px)', 'MODULE_CONTENT_PRODUCTS_SLIDER_SHOW_WIDTH', '160', 'The width of one block (px)', '6', '0', now())");
      $osC_Database->simpleQuery("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('The height of one block (px)', 'MODULE_CONTENT_PRODUCTS_SLIDER_SHOW_HEIGHT', '135', 'The height of one block (px)', '6', '0', now())");
    }

    function getKeys() {
      if (!isset($this->_keys)) {
        $this->_keys = array('MODULE_CONTENT_PRODUCTS_SLIDER_PRODUCTS_TYPE',
        		     'MODULE_CONTENT_PRODUCTS_SLIDER_INTERVAL',
                             'MODULE_CONTENT_PRODUCTS_SLIDER_SPEED',
                             'MODULE_CONTENT_PRODUCTS_SLIDER_VISIBLE',
                             'MODULE_CONTENT_PRODUCTS_SLIDER_SCROLL',
                             'MODULE_CONTENT_PRODUCTS_SLIDER_MAX_DISPLAY',
                             'MODULE_CONTENT_PRODUCTS_SLIDER_SHOW_WIDTH',
                             'MODULE_CONTENT_PRODUCTS_SLIDER_SHOW_HEIGHT');
      }

      return $this->_keys;
    }
  }
?>
