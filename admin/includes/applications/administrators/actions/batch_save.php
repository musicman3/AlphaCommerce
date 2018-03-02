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

  class osC_Application_Administrators_Actions_batch_save extends osC_Application_Administrators {
    public function __construct() {
      global $osC_Language, $osC_MessageStack;

      parent::__construct();

      if ( isset($_POST['batch']) && is_array($_POST['batch']) && !empty($_POST['batch']) ) {
        $this->_page_contents = 'batch_edit.php';

        if ( isset($_POST['subaction']) && ($_POST['subaction'] == 'confirm') ) {
          $error = false;

          foreach ( $_POST['batch'] as $id ) {
            if ( !osC_Administrators_Admin::setAccessLevels($id, $_POST['modules'], $_POST['mode']) ) {
              $error = true;
              break;
            }
          }

          if ( $error === false ) {
            $osC_MessageStack->add($this->_module, $osC_Language->get('ms_success_action_performed'), 'success');

            if ( in_array($_SESSION['admin']['id'], $_POST['batch']) ) {
              $_SESSION['admin']['access'] = osC_Access::getUserLevels($_SESSION['admin']['id']);
            }
          } else {
            $osC_MessageStack->add($this->_module, $osC_Language->get('ms_error_action_not_performed'), 'error');
          }

          osc_redirect_admin(osc_href_link_admin(FILENAME_DEFAULT, $this->_module));
        }
      }
    }
  }
?>
