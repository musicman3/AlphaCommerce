<?php
/*
  $Id$

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
  <span style="float: right;"><?php echo '<input type="button" value="' . $osC_Language->get('button_insert') . '" onclick="document.location.href=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&action=save') . '\';" class="infoBoxButton" />'; ?></span>
</div>

<div style="clear: both; padding: 2px; height: 16px;">
  <span id="batchTotalPages"></span>
  <span id="batchPageLinks"></span>
</div>

<form name="batch" action="#" method="post">

<table border="0" width="100%" cellspacing="0" cellpadding="2" class="dataTable" id="taxClassDataTable">
  <thead>
    <tr>
      <th align="left"><?php echo $osC_Language->get('table_heading_tax_classes'); ?></th>
      <th><?php echo $osC_Language->get('table_heading_total_rates'); ?></th>
      <th align="right" width="150"><?php echo $osC_Language->get('table_heading_action'); ?></th>
      <th align="center" width="20"><?php echo osc_draw_checkbox_field('batchFlag', null, null, 'onclick="flagCheckboxes(this);"'); ?></th>
    </tr>
  </thead>
  <tfoot>
    <tr>
      <th align="right" colspan="3"><?php echo '<input type="image" src="' . osc_icon_raw('trash.png') . '" title="' . $osC_Language->get('icon_trash') . '" onclick="document.batch.action=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&action=batch_delete') . '\';" />'; ?></th>
      <th align="center" width="20"><?php echo osc_draw_checkbox_field('batchFlag', null, null, 'onclick="flagCheckboxes(this);"'); ?></th>
    </tr>
  </tfoot>
  <tbody>
  </tbody>
</table>

</form>

<div style="padding: 2px;">
  <span id="dataTableLegend"><?php echo '<b>' . $osC_Language->get('table_action_legend') . '</b> ' . osc_icon('edit.png') . '&nbsp;' . $osC_Language->get('icon_edit') . '&nbsp;&nbsp;' . osc_icon('trash.png') . '&nbsp;' . $osC_Language->get('icon_trash'); ?></span>
  <span id="batchPullDownMenu"></span>
</div>

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

  var dataTableName = 'taxClassDataTable';
  var dataTableDataURL = '<?php echo osc_href_link_admin(FILENAME_RPC, $osC_Template->getModule() . '&action=getAll'); ?>';

  var classLink = '<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '=CLASSID'); ?>';
  var classLinkIcon = '<?php echo osc_icon('folder.png'); ?>';

  var classEditLink = '<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&tcID=CLASSID&action=save'); ?>';
  var classEditLinkIcon = '<?php echo osc_icon('edit.png'); ?>';

  var classDeleteLink = '<?php echo osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() . '&tcID=CLASSID&action=delete'); ?>';
  var classDeleteLinkIcon = '<?php echo osc_icon('trash.png'); ?>';

  var osC_DataTable = new osC_DataTable();
  osC_DataTable.load();

  function feedDataTable(data) {
    var rowCounter = 0;

    for ( var r in data.entries ) {
      var record = data.entries[r];

      var newRow = $('#' + dataTableName)[0].tBodies[0].insertRow(rowCounter);
      newRow.id = 'row' + parseInt(record.tax_class_id);

      $('#row' + parseInt(record.tax_class_id)).mouseover( function() { rowOverEffect(this); }).mouseout( function() { rowOutEffect(this); }).click(function(event) {
        if (event.target.type !== 'checkbox') {
          $(':checkbox', this).trigger('click');
        }
      }).css('cursor', 'pointer');

      var newCell = newRow.insertCell(0);
      newCell.innerHTML = '<a href="' + classLink.replace('CLASSID', parseInt(record.tax_class_id)) + '">' + classLinkIcon + '&nbsp;' + htmlSpecialChars(record.tax_class_title) + '</a>';

      newCell = newRow.insertCell(1);
      newCell.innerHTML = parseInt(record.total_tax_rates);
	  newCell.align = 'center';

      newCell = newRow.insertCell(2);
      newCell.innerHTML = '<a href="' + classEditLink.replace('CLASSID', parseInt(record.tax_class_id)) + '">' + classEditLinkIcon + '</a>&nbsp;<a href="' + classDeleteLink.replace('CLASSID', parseInt(record.tax_class_id)) + '">' + classDeleteLinkIcon + '</a>';
      newCell.align = 'right';

      newCell = newRow.insertCell(3);
      newCell.innerHTML = '<input type="checkbox" name="batch[]" value="' + parseInt(record.tax_class_id) + '" id="batch' + parseInt(record.tax_class_id) + '" />';
      newCell.align = 'center';

      rowCounter++;
    }
  }
//--></script>
