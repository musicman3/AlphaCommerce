<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2006 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  class osC_Boxes_shopping_cart extends osC_Modules {
    var $_title,
        $_code = 'shopping_cart',
        $_author_name = 'osCommerce',
        $_author_www = 'http://www.oscommerce.com',
        $_group = 'boxes';

    function osC_Boxes_shopping_cart() {
      global $osC_Language;

      $this->_title = $osC_Language->get('box_shopping_cart_heading');
    }

    function initialize() {
      global $osC_Language, $osC_Template, $osC_ShoppingCart, $osC_Currencies;

      $this->_title_link = osc_href_link(FILENAME_CHECKOUT, null);

      if ($osC_ShoppingCart->hasContents()) {
        $this->_content = '<table border="0" width="100%" cellspacing="0" cellpadding="0">';

        foreach ($osC_ShoppingCart->getProducts() as $products) {
          $this->_content .= '  <tr>' .
                             '    <td align="right" valign="top">&nbsp;' . $products['quantity'] . '&nbsp;x&nbsp;</td>' .
                             '    <td valign="top">' . osc_link_object(osc_href_link(FILENAME_PRODUCTS, $products['keyword']), $products['name']) . '</td>' .
                             '  </tr>';
        }

        $this->_content .= '</table>' .
                           '<table border="0" width="100%" cellspacing="0" cellpadding="0"><tr><td align="center" valign="top">' . $osC_Language->get('box_shopping_cart_subtotal') . ' ' . $osC_Currencies->format($osC_ShoppingCart->getTotal()) . '</td></tr></table>' .
                           '<table border="0" width="100%" cellspacing="0" cellpadding="0"><tr><td align="center" valign="top"><br />' . $osC_Template->osc_draw_image_jquery_button_go(array('go' => osc_href_link(FILENAME_CHECKOUT), 'icon' => 'pencil', 'title' => $osC_Language->get('ajaxcart_checkout'))) . '</td></tr></table>';
      } else {
        $this->_content = $osC_Language->get('box_shopping_cart_empty');
      }
    }
  }
?>
