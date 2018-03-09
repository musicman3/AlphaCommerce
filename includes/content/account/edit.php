<?php
/*
  $Id:edit.php 188 2005-09-15 02:25:52 +0200 (Do, 15 Sep 2005) hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2005 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/

  require('includes/classes/account.php');

  class osC_Account_Edit extends osC_Template {

/* Private variables */

    var $_module = 'edit',
        $_group = 'account',
        $_page_title,
        $_page_contents = 'account_edit.php',
        $_page_image = 'table_background_account.gif';

/* Class constructor */

    function osC_Account_Edit() {
      global $osC_Language, $osC_Services, $osC_Breadcrumb;

      $this->_page_title = $osC_Language->get('account_edit_heading');

      $this->addJavascriptPhpFilename('includes/form_check.js.php');

      if ($osC_Services->isStarted('breadcrumb')) {
        $osC_Breadcrumb->add($osC_Language->get('breadcrumb_edit_account'), osc_href_link(FILENAME_ACCOUNT, $this->_module, 'SSL'));
      }

      if ($_GET[$this->_module] == 'save') {
        $this->_process();
      }
    }

/*Private methods */

    function _process() {
      global $osC_MessageStack, $osC_Database, $osC_Language, $osC_Customer;

      $data = array();

      if (ACCOUNT_GENDER >= 0) {
        if (isset($_POST['gender']) && (($_POST['gender'] == 'm') || ($_POST['gender'] == 'f'))) {
          $data['gender'] = $_POST['gender'];
        } else {
          $osC_MessageStack->add('account_edit', $osC_Language->get('field_customer_gender_error'));
        }
      }

      if (isset($_POST['firstname']) && (strlen(trim($_POST['firstname'])) >= ACCOUNT_FIRST_NAME)) {
        $data['firstname'] = $_POST['firstname'];
      } else {
        $osC_MessageStack->add('account_edit', sprintf($osC_Language->get('field_customer_first_name_error'), ACCOUNT_FIRST_NAME));
      }

      if (isset($_POST['lastname']) && (strlen(trim($_POST['lastname'])) >= ACCOUNT_LAST_NAME)) {
        $data['lastname'] = $_POST['lastname'];
      } else {
        $osC_MessageStack->add('account_edit', sprintf($osC_Language->get('field_customer_last_name_error'), ACCOUNT_LAST_NAME));
      }

      if (ACCOUNT_DATE_OF_BIRTH == '1') {
        if (isset($_POST['dob_days']) && isset($_POST['dob_months']) && isset($_POST['dob_years']) && checkdate($_POST['dob_months'], $_POST['dob_days'], $_POST['dob_years'])) {
          $data['dob'] = mktime(0, 0, 0, $_POST['dob_months'], $_POST['dob_days'], $_POST['dob_years']);
        } else {
          $osC_MessageStack->add('account_edit', $osC_Language->get('field_customer_date_of_birth_error'));
        }
      }

      if (isset($_POST['email_address']) && (strlen(trim($_POST['email_address'])) >= ACCOUNT_EMAIL_ADDRESS)) {
        if (osc_validate_email_address($_POST['email_address'])) {
          if (osC_AccountClass::checkDuplicateEntry($_POST['email_address']) === false) {
            $data['email_address'] = $_POST['email_address'];
          } else {
            $osC_MessageStack->add('account_edit', $osC_Language->get('field_customer_email_address_exists_error'));
          }
        } else {
          $osC_MessageStack->add('account_edit', $osC_Language->get('field_customer_email_address_check_error'));
        }
      } else {
        $osC_MessageStack->add('account_edit', sprintf($osC_Language->get('field_customer_email_address_error'), ACCOUNT_EMAIL_ADDRESS));
      }

      if ($osC_MessageStack->size('account_edit') === 0) {
        if (osC_AccountClass::saveEntry($data)) {
// reset the session variables
          if (ACCOUNT_GENDER > -1) {
            $osC_Customer->setGender($data['gender']);
          }
          $osC_Customer->setFirstName(trim($data['firstname']));
          $osC_Customer->setLastName(trim($data['lastname']));
          $osC_Customer->setEmailAddress($data['email_address']);

          $osC_MessageStack->add('account', $osC_Language->get('success_account_updated'), 'success');
        }

        osc_redirect(osc_href_link(FILENAME_ACCOUNT, null, 'SSL'));
      }
    }
  }
?>
