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

  if (isset($_GET['edit'])) {
    $Qentry = osC_AddressBookClass::getEntry($_GET['address_book']);
  } else {
    if (osC_AddressBookClass::numberOfEntries() >= MAX_ADDRESS_BOOK_ENTRIES) {
      $osC_MessageStack->add('address_book', $osC_Language->get('error_address_book_full'));
    }
  }
?>

<?php if (file_exists('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage()) == true) {
echo osc_image('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<?php
  if ($osC_MessageStack->size('address_book') > 0) {
    echo $osC_MessageStack->get('address_book');
  }

  if ( ($osC_Customer->hasDefaultAddress() === false) || (isset($_GET['new']) && (osC_AddressBookClass::numberOfEntries() < MAX_ADDRESS_BOOK_ENTRIES)) || (isset($Qentry) && ($Qentry->numberOfRows() === 1)) ) {
?>

<form name="address_book" action="<?php echo osc_href_link(FILENAME_ACCOUNT, 'address_book=' . $_GET['address_book'] . '&' . (isset($_GET['edit']) ? 'edit' : 'new') . '=save', 'SSL'); ?>" method="post" onsubmit="return check_form(address_book);">

<div class="moduleBox">
  <em style="float: right; margin-top: 10px;"><?php echo $osC_Language->get('form_required_information'); ?></em>

  <h6><?php echo $osC_Language->get('address_book_new_address_title'); ?></h6>

  <div class="content">

<?php
    include('includes/modules/address_book_details.php');
?>

  </div>
</div>

<div class="submitFormButtons">
  <span style="float: right;"><?php echo $osC_Template->osc_draw_image_jquery_button(array('icon' => 'triangle-1-e', 'title' => $osC_Language->get('button_continue'))); ?></span>

<?php
    if ($osC_NavigationHistory->hasSnapshot()) {
      $back_link = $osC_NavigationHistory->getSnapshotURL();
    } elseif ($osC_Customer->hasDefaultAddress() === false) {
      $back_link = osc_href_link(FILENAME_ACCOUNT, null, 'SSL');
    } else {
      $back_link = osc_href_link(FILENAME_ACCOUNT, 'address_book', 'SSL');
    }

    echo $osC_Template->osc_draw_image_jquery_button(array('href' => $back_link, 'icon' => 'triangle-1-w', 'title' => $osC_Language->get('button_back')));
?>

</div>

</form>

<?php
  } else {
?>

<div class="submitFormButtons">
  <?php $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, 'address_book', 'SSL'), 'icon' => 'triangle-1-w', 'title' => $osC_Language->get('button_back'))); ?>
</div>

<?php
  }
?>
