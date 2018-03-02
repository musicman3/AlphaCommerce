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

  $osC_ObjectInfo = new osC_ObjectInfo(osC_Administrators_Admin::get($_GET['aID']));
?>

<h1><?php echo osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()), $osC_Template->getPageTitle()); ?></h1>

<?php
  if ( $osC_MessageStack->exists($osC_Template->getModule()) ) {
    echo $osC_MessageStack->get($osC_Template->getModule());
  }
?>

<div class="infoBoxHeading"><?php echo osc_icon('edit.png') . ' ' . $osC_ObjectInfo->getProtected('user_name'); ?></div>
<div class="infoBoxContent">
  <form name="aEdit" class="dataForm" autocomplete="off" action="<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&aID=' . $osC_ObjectInfo->getInt('id') . '&action=save'); ?>" method="post">

  <p><?php echo $osC_Language->get('introduction_edit_administrator'); ?></p>

  <fieldset>
    <div><label for="user_name"><?php echo $osC_Language->get('field_username'); ?></label><?php echo osc_draw_input_field('user_name', $osC_ObjectInfo->get('user_name')); ?></div>
    <div><label for="user_password"><?php echo $osC_Language->get('field_password'); ?></label><?php echo osc_draw_password_field('user_password'); ?></div>

    <div><select name="accessModules" id="modulesList"><option value="-1" disabled="disabled"><?php echo $osC_Language->get('access_configuration_access_modules'); ?></option><option value="0"><?php echo $osC_Language->get('global_access'); ?></option></select></div>

    <ul id="accessToModules" class="modulesListing"></ul>
  </fieldset>

  <p align="center"><?php echo osc_draw_hidden_field('subaction', 'confirm') . '<input type="submit" value="' . $osC_Language->get('button_save') . '" class="operationButton" /> <input type="button" value="' . $osC_Language->get('button_cancel') . '" onclick="document.location.href=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()) . '\';" class="operationButton" />'; ?></p>

  </form>
</div>

<script type="text/javascript"><!--
  var accessModules = <?php echo json_encode(osC_Administrators_Admin::getAccessModules()); ?>;
  var hasAccessTo = <?php echo json_encode($osC_ObjectInfo->get('access_modules')); ?>;
  var deleteAccessModuleIcon = '<?php echo osc_icon('uninstall.png'); ?>';

  var $modulesList = $('#modulesList');

  $.each(accessModules, function(i, item) {
    var sGroup = document.createElement('optgroup');
    sGroup.label = i;

    $.each(item, function(key, value) {
      var sOption = new Option(value['text'], value['id']);
      sOption.id = 'am' + value['id'];

      sGroup.appendChild(sOption);

      if ( $.inArray(value['id'], hasAccessTo) != -1 ) {
        $('#accessToModules').append('<li id="atm' + value['id'] + '">' + i + ' &raquo; ' + value['text'] + ' <span style="float: right;"><a href="#" onclick="removeAccessToModule(\'' + value['id'] + '\');">' + deleteAccessModuleIcon + '</a><input type="hidden" name="modules[]" value="' + value['id'] + '" /></span></li>');
        sOption.disabled = 'disabled';
      }
    });

    $modulesList.append(sGroup); 
  });

  if ( $.inArray('*', hasAccessTo) != -1 ) {
    $('#modulesList').val('0');

    $('#accessToModules').append('<li id="atm' + $('#modulesList :selected').val() + '">' + $('#modulesList :selected').text() + ' <span style="float: right;"><a href="#" onclick="removeAccessToModule(\'' + $('#modulesList :selected').val() + '\');">' + deleteAccessModuleIcon + '</a><input type="hidden" name="modules[]" value="' + $('#modulesList :selected').val() + '" /></span></li>');

    $('#modulesList').attr('disabled', 'disabled');
    $('#modulesList').val('-1');
  }

  $('#modulesList').change(function() {
    if ( $('#modulesList :selected').val() == '0' ) {
      $('#accessToModules li').remove();
      $('#accessToModules').append('<li id="atm' + $('#modulesList :selected').val() + '">' + $('#modulesList :selected').text() + ' <span style="float: right;"><a href="#" onclick="removeAccessToModule(\'' + $('#modulesList :selected').val() + '\');">' + deleteAccessModuleIcon + '</a><input type="hidden" name="modules[]" value="' + $('#modulesList :selected').val() + '" /></span></li>');

      $('#modulesList').attr('disabled', 'disabled');
      $('#modulesList').val('-1');

      $('#accessToModules li').tsort();
    } else if ( $('#modulesList :selected').val() != '-1' ) {
      $('#accessToModules').append('<li id="atm' + $('#modulesList :selected').val() + '">' + $('#modulesList :selected').parent().attr('label') + ' &raquo; ' + $('#modulesList :selected').text() + ' <span style="float: right;"><a href="#" onclick="removeAccessToModule(\'' + $('#modulesList :selected').val() + '\');">' + deleteAccessModuleIcon + '</a><input type="hidden" name="modules[]" value="' + $('#modulesList :selected').val() + '" /></span></li>');

      $('#modulesList :selected').attr('disabled', 'disabled');
      $('#modulesList').val('-1');

      $('#accessToModules li').tsort();
    }
  });

  function removeAccessToModule(module) {
    if ( module == '0' ) {
      $('#modulesList').removeAttr('disabled');
      $('#modulesList :disabled').removeAttr('disabled');
      $('#modulesList :first').attr('disabled', 'disabled');
    } else {
      $('#am' + module).removeAttr('disabled');
    }

    $('#atm' + module).remove();
  }
//--></script>
