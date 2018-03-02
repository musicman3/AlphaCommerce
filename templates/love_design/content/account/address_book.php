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
?>

<?php if (file_exists('images/' . $osC_Template->getPageImage()) == true) {
echo osc_image(DIR_WS_IMAGES . $osC_Template->getPageImage(), $osC_Template->getPageTitle(), HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<?php
  if ($osC_MessageStack->size('address_book') > 0) {
    echo $osC_MessageStack->get('address_book');
  }
?>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('primary_address_title'); ?></h6>

  <div class="content">
    <div style="float: right; padding: 0px 0px 10px 20px;">
      <?php echo osC_Address::format($osC_Customer->getDefaultAddressID(), '<br />'); ?>
    </div>

    <div style="float: right; padding: 0px 0px 10px 20px; text-align: center;">
      <?php echo '<b>' . $osC_Language->get('primary_address_title') . '</b><br />' . osc_image('templates/' . $osC_Template->getCode() . '/images/arrow_south_east.png'); ?>
    </div>

    <?php echo $osC_Language->get('primary_address_description'); ?>

    <div style="clear: both;"></div>
  </div>
</div>

<div class="moduleBox">
  <h6><?php echo $osC_Language->get('address_book_title'); ?></h6>

  <div class="content">
    <table border="0" width="100%" cellspacing="0" cellpadding="2">

<?php
  $Qaddresses = osC_AddressBook::getListing();

  while ($Qaddresses->next()) {
?>

      <tr class="moduleRow">
        <td>
          <b><?php echo $Qaddresses->valueProtected('firstname') . ' ' . $Qaddresses->valueProtected('lastname'); ?></b>

<?php
    if ($Qaddresses->valueInt('address_book_id') == $osC_Customer->getDefaultAddressID()) {
      echo '&nbsp;<small><i>' . $osC_Language->get('primary_address_marker') . '</i></small>';
    }
?>

        </td>
        <td class="submitFormButtons" align="right"><?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, 'address_book=' . $Qaddresses->valueInt('address_book_id') . '&edit', 'SSL'), 'icon' => 'pencil', 'title' => $osC_Language->get('button_edit'))) . '&nbsp;' . $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, 'address_book=' . $Qaddresses->valueInt('address_book_id') . '&delete', 'SSL'), 'icon' => 'trash', 'title' => $osC_Language->get('button_delete'))); ?></td>
      </tr>
      <tr>
        <td colspan="2" style="padding: 0px 0px 10px 10px;"><?php echo osC_Address::format($Qaddresses->toArray(), '<br />'); ?></td>
      </tr>

<?php
  }
?>

    </table>
  </div>
</div>

<div class="submitFormButtons">
  <span style="float: right;">

<?php
  if ($Qaddresses->numberOfRows() < MAX_ADDRESS_BOOK_ENTRIES) {
    echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, 'address_book&new', 'SSL'), 'icon' => 'home', 'title' => $osC_Language->get('button_add_address')));
  } else {
    echo sprintf($osC_Language->get('address_book_maximum_entries'), MAX_ADDRESS_BOOK_ENTRIES);
  }
?>

  </span>

  <?php echo $osC_Template->osc_draw_image_jquery_button(array('href' => osc_href_link(FILENAME_ACCOUNT, null, 'SSL'), 'icon' => 'triangle-1-w', 'title' => $osC_Language->get('button_back'))); ?>
</div>
