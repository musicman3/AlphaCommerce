<?php
/*
  $Id: main.php 1845 2009-02-27 00:19:37Z hpdl $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2009 osCommerce

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License v2 (1991)
  as published by the Free Software Foundation.
*/
?>

<h1><?php echo osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()), $osC_Template->getPageTitle()); ?></h1>

<?php
  if ( $osC_MessageStack->exists($osC_Template->getModule()) ) {
    echo $osC_MessageStack->get($osC_Template->getModule());
  }
?>

<div style="padding-bottom: 10px;">
  <span><form id="liveSearchForm"><input type="text" id="liveSearchField" name="search" class="searchField fieldTitleAsDefault" title= <?php echo $osC_Language->get('access_configuration_search') ?> /><input type="button" value= <?php echo $osC_Language->get('access_configuration_reset') ?> class="operationButton" onclick="osC_DataTable.reset();" /></form></span>
</div>

<div id="infoPane" class="ui-corner-all" style="float: left; width: 150px;">

  <ul>

<?php
//Multilingual start
	$Ckey = $osC_Database->query("SELECT * FROM " . DB_TABLE_PREFIX . "configuration WHERE configuration_key = 'STORE_NAME_ADDRESS'");	
	$configuration_title = $Ckey->value('configuration_title');
	$configuration_description = $Ckey->value('configuration_description');

	for ($x=1; $x<169; $x++){
		${'title'.$x} = $osC_Language->get('access_configuration_title'.($x+18));
	}
	if (($configuration_title & $configuration_description) != ($title9 & $title93)) {
		for ($x=1; $x<85; $x++){
			$osC_Database->simpleQuery("UPDATE " . DB_TABLE_PREFIX . "configuration SET configuration_title = '${'title'.$x}', configuration_description = '${'title'.($x+84)}' WHERE configuration_id = '$x'");
		}

	$title169 = $osC_Language->get('access_configuration_title246');	
	$title170 = $osC_Language->get('access_configuration_title247');	
	$osC_Database->simpleQuery("UPDATE " . DB_TABLE_PREFIX . "configuration SET configuration_title = '$title169', configuration_description = '$title170' WHERE configuration_key = 'NEW_PRODUCTS_CART'");
	$title171 = $osC_Language->get('access_configuration_title266');	
	$title172 = $osC_Language->get('access_configuration_title267');	
	$osC_Database->simpleQuery("UPDATE " . DB_TABLE_PREFIX . "configuration SET configuration_title = '$title171', configuration_description = '$title172' WHERE configuration_key = 'MAINTENANCE_MODE'");
	$title173 = $osC_Language->get('access_configuration_title273');	
	$title174 = $osC_Language->get('access_configuration_title274');	
	$osC_Database->simpleQuery("UPDATE " . DB_TABLE_PREFIX . "configuration SET configuration_title = '$title173', configuration_description = '$title174' WHERE configuration_key = 'PRODUCTS_LIST_GRID'");
	}
//Multilingual end
	
    echo '<li id="cfgGroup1" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=1'), $osC_Language->get('access_configuration_title1')) . '</li>';
    echo '<li id="cfgGroup2" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=2'), $osC_Language->get('access_configuration_title2')) . '</li>';
    echo '<li id="cfgGroup3" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=3'), $osC_Language->get('access_configuration_title3')) . '</li>';
    echo '<li id="cfgGroup4" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=4'), $osC_Language->get('access_configuration_title4')) . '</li>';
    echo '<li id="cfgGroup5" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=5'), $osC_Language->get('access_configuration_title5')) . '</li>';

    echo '<li id="cfgGroup7" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=7'), $osC_Language->get('access_configuration_title7')) . '</li>';
    echo '<li id="cfgGroup8" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=8'), $osC_Language->get('access_configuration_title8')) . '</li>';
    echo '<li id="cfgGroup9" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=9'), $osC_Language->get('access_configuration_title9')) . '</li>';
    echo '<li id="cfgGroup12" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=12'), $osC_Language->get('access_configuration_title12')) . '</li>';
    //echo '<li id="cfgGroup13" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=13'), $osC_Language->get('access_configuration_title13')) . '</li>';
    echo '<li id="cfgGroup16" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=16'), $osC_Language->get('access_configuration_title16')) . '</li>';
    echo '<li id="cfgGroup17" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=17'), $osC_Language->get('access_configuration_title17')) . '</li>';
    echo '<li id="cfgGroup18" style="list-style: circle;">' . osc_link_object(osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=18'), $osC_Language->get('access_configuration_title18')) . '</li>';	
  
?>

  </ul>

</div>

<script type="text/javascript"><!--
  $('#cfgGroup<?php echo (int)$_GET['gID']; ?>').css('listStyle', 'disc').find('a').css({'fontWeight': 'bold', 'textDecoration': 'none'});
//--></script>

<div id="dataTableContainer" style="margin-left: 160px;">
  <div style="padding: 2px; min-height: 16px;">
    <span id="batchTotalPages"></span>
    <span id="batchPageLinks"></span>
  </div>

  <form name="batch" action="#" method="post">

  <table border="0" width="100%" cellspacing="0" cellpadding="2" class="dataTable" id="configurationDataTable">
    <thead>
      <tr>
        <th align="left" width="35%;"><?php echo $osC_Language->get('table_heading_title'); ?></th>
        <th align="left"><?php echo $osC_Language->get('table_heading_value'); ?></th>
        <th align="right" width="150"><?php echo $osC_Language->get('table_heading_action'); ?></th>
        <th align="center" width="20"><?php echo osc_draw_checkbox_field('batchFlag', null, null, 'onclick="flagCheckboxes(this);"'); ?></th>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <th align="right" colspan="3"><?php echo '<input type="image" src="' . osc_icon_raw('edit.png') . '" title="' . $osC_Language->get('icon_edit') . '" onclick="document.batch.action=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=' . $_GET['gID'] . '&action=batch_save') . '\';" />'; ?></th>
        <th align="center" width="20"><?php echo osc_draw_checkbox_field('batchFlag', null, null, 'onclick="flagCheckboxes(this);"'); ?></th>
      </tr>
    </tfoot>
    <tbody>
    </tbody>
  </table>

  </form>

  <div style="padding: 2px; min-height: 16px;">
    <span id="dataTableLegend"><?php echo '<b>' . $osC_Language->get('table_action_legend') . '</b> ' . osc_icon('edit.png') . '&nbsp;' . $osC_Language->get('icon_edit'); ?></span>
    <span id="batchPullDownMenu"></span>
  </div>
</div>

<div style="clear: both;"></div>

<script type="text/javascript"><!--
  var moduleParamsCookieName = 'oscadmin_module_' + pageModule;

  var moduleParams = new Object();
  moduleParams.page = 1;
  moduleParams.search = '';

  if ( $.cookie(moduleParamsCookieName) != null ) {
    var p = $.secureEvalJSON($.cookie(moduleParamsCookieName));
    moduleParams.page = parseInt(p.page);
    moduleParams.search = String(p.search);
  }

  var dataTableName = 'configurationDataTable';
  var dataTableDataURL = '<?php echo osc_href_link_admin('rpc.php', $osC_Template->getModule() . '&action=getAll&gID=' . (int)$_GET['gID']); ?>';

  var configEditLink = '<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&gID=' . (int)$_GET['gID'] . '&cID=CONFIGID&action=save'); ?>';
  var configEditLinkIcon = '<?php echo osc_icon('edit.png'); ?>';

  var osC_DataTable = new osC_DataTable();
  osC_DataTable.load();

  function feedDataTable(data) {
    var rowCounter = 0;

    for ( var r in data.entries ) {
      var record = data.entries[r];

      var newRow = $('#' + dataTableName)[0].tBodies[0].insertRow(rowCounter);
      newRow.id = 'row' + parseInt(record.configuration_id);

      $('#row' + parseInt(record.configuration_id)).mouseover( function() { rowOverEffect(this); }).mouseout( function() { rowOutEffect(this); }).click(function(event) {
        if (event.target.type !== 'checkbox') {
          $(':checkbox', this).trigger('click');
        }
      }).css('cursor', 'pointer');

      var newCell = newRow.insertCell(0);
      newCell.innerHTML = htmlSpecialChars(record.configuration_title);

      var newCell = newRow.insertCell(1);
      newCell.innerHTML = htmlSpecialChars(record.configuration_value).replace(/([^>]?)\n/g, '$1<br />\n'); // nl2br()

      newCell = newRow.insertCell(2);
      newCell.innerHTML = '<a href="' + configEditLink.replace('CONFIGID', parseInt(record.configuration_id)) + '">' + configEditLinkIcon + '</a>';
      newCell.align = 'right';

      newCell = newRow.insertCell(3);
      newCell.innerHTML = '<input type="checkbox" name="batch[]" value="' + parseInt(record.configuration_id) + '" id="batch' + parseInt(record.configuration_id) + '" />';
      newCell.align = 'center';

      rowCounter++;
    }
  }

/* HPDL
  var infoPaneWidth = $('#dataTableContainer').css('marginLeft');

  function toggleInfoPane() {
    if ( $('#dataTableContainer').css('marginLeft') == '0px' ) {
      $('#dataTableContainer').css('marginLeft', infoPaneWidth);
      $('#infoPane').show('fast');
    } else {
      $('#infoPane').hide('fast', function() { $('#dataTableContainer').css('marginLeft', '0px'); });
    }
  }
*/
//--></script>
