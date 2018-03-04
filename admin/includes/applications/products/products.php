<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2009 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/
  require('includes/applications/products/classes/xsell.php');
  require('includes/applications/products/classes/products.php');
  require('includes/applications/product_attributes/classes/product_attributes.php');
  require('../includes/classes/variants.php');

  class osC_Application_Products extends osC_Template_Admin {

/* Protected variables */

    protected $_module = 'products',
              $_page_title,
              $_page_contents = 'main.php';

/* Class constructor */

    function __construct() {
      global $osC_Language, $osC_MessageStack, $osC_Currencies, $osC_Tax, $osC_CategoryTree, $osC_Image, $current_category_id;

      $this->_page_title = $osC_Language->get('heading_title');

      $current_category_id = 0;

      if ( isset($_GET['cID']) && is_numeric($_GET['cID']) ) {
        $current_category_id = $_GET['cID'];
      } else {
        $_GET['cID'] = $current_category_id;
      }

      require('../includes/classes/currencies.php');
      $osC_Currencies = new osC_Currencies();

      require('includes/classes/tax.php');
      $osC_Tax = new osC_Tax_Admin();

      require('includes/classes/category_tree.php');
      $osC_CategoryTree = new osC_CategoryTree_Admin();
      $osC_CategoryTree->setSpacerString('&nbsp;', 2);

      require('includes/classes/image.php');
      $osC_Image = new osC_Image_Admin();

// check if the catalog image directory exists
      if (is_dir(realpath('../images/products'))) {
        if (!is_writeable(realpath('../images/products'))) {
          $osC_MessageStack->add('header', sprintf($osC_Language->get('ms_error_image_directory_not_writable'), realpath('../images/products')), 'error');
        }
      } else {
        $osC_MessageStack->add('header', sprintf($osC_Language->get('ms_error_image_directory_non_existant'), realpath('../images/products')), 'error');
      }
// Xsell
      if ( !isset($_GET['action']) ) {
        $_GET['action'] = '';
      }
      
      if ( !isset($_GET['page']) || ( isset($_GET['page']) && !is_numeric($_GET['page']) ) ) {
        $_GET['page'] = 1;
      }
      
      if ( !empty($_GET['action']) ) {
        switch ($_GET['action']) {

          case 'xsell':
            $this->_page_contents = 'xsell.php';

            if ( isset($_POST['subaction']) && ($_POST['subaction'] == 'sort_confirm') ) {
                $error = false;
          
                foreach ($_POST as $value => $xvalue) {
                        $data = array('products_xsell_id' => $value,
                                      'short_order' => $xvalue,
                                      'products_id' => $_GET['add_related_products_ID']);                    

                        if ( !osC_xproducts_Admin::xsell_save_sort($data) ) {
                            $osC_MessageStack->add($this->_module, $osC_Language->get('ms_error_action_not_performed'), 'error');
                            $error = true;
                        }
                }   
            
                if ( $error === false ) {
                    $osC_MessageStack->add($this->_module, $osC_Language->get('ms_success_action_performed'), 'success');
                    osc_redirect_admin(osc_href_link_admin(FILENAME_DEFAULT, $this->_module .
                    '&action=xsell&sort=1&add_related_article_ID=' .
                    $_GET['add_related_article_ID']));
                }

            }

            if ( isset($_POST['subaction']) && ($_POST['subaction'] == 'categories_confirm') ) {
                $error = false;
                
                   osc_redirect_admin(osc_href_link_admin(FILENAME_DEFAULT, $this->_module .
                    '&action=xsell&cPath=' . $_POST['cPath'] . '&add_related_products_ID=' .
                    $_GET['add_related_products_ID']));

            }            

            if ( isset($_POST['subaction']) && ($_POST['subaction'] == 'save_confirm') ) {
                $error = false;

                if ($_POST['run_update'] == true) {
                                            
                
                       $data = array('products_id' => $_GET['add_related_products_ID']);

                        if ( !osC_xproducts_Admin::xsell_delete_all($data)) {
                            $osC_MessageStack->add($this->_module, $osC_Language->get('ms_error_action_not_performed') . " in delete process", 'error');
                            $error = true;
                        }
                }
                
                if (isset($_POST['products_xsell_id']) && ($_POST['products_xsell_id'])) {
                
                        foreach ($_POST['products_xsell_id'] as $temp) {
                            $data_xproducts = $_GET['add_related_products_ID'];
                            $data_xsell = $temp;
                            
                            if ( !osC_xproducts_Admin::xsell_update($data_xproducts, $data_xsell)) {
                                $osC_MessageStack->add($this->_module, $osC_Language->get('ms_error_action_not_performed') . "-> " . $data_xsell, 'error');
                                $error = true;
                            }
                        }
                }        
                
                if ( $error === false ) {
                    $osC_MessageStack->add($this->_module, $osC_Language->get('ms_success_action_performed'), 'success');
                    osc_redirect_admin(osc_href_link_admin(FILENAME_DEFAULT, $this->_module .
                    '&action=xsell'));
                }
                
            }   
            
            break;

        }
     }
    }
  }
?>
