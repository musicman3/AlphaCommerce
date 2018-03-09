<?php
/*
$Id: $

author Dave Howarth
copyright 2008
web http://www.box25.net
email sales@box25.net

Filename cms.php
Desc Basic CMS system for osCommerce V3.0A5
Modify by Gergely
http://oscommerce-extra.hu
*/


	// define the max number of articles to display
	$max_articles = MAX_DISPLAY_CMS_ARTICLES;
	// grab a list of cms items
	$osC_Cms = new osC_Cms();
	$QcmsList = $osC_Cms->getListing();

?>

<?php if (file_exists('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage()) == true) {
echo osc_image('templates/' . $osC_Template->getCode() . '/' . DIR_WS_IMAGES . 'icons/' . $osC_Template->getPageImage(), '', '', HEADING_IMAGE_HEIGHT_ICON, 'id="pageIcon"');
} else {}
?>

<h1><?php echo $osC_Template->getPageTitle(); ?></h1>

<!-- start of CMS search -->
<?php echo '<form name="search" action="' . osc_href_link(FILENAME_CMS, null, 'NONSSL', false) . '" method="get">' .
	osc_draw_input_field('cmskeyword', null, 'style="width: 80%;" maxlength="30"') . '&nbsp;' . osc_draw_hidden_session_id_field() . $osC_Template->osc_draw_image_jquery_button(array('icon' => 'search', 'title' => $osC_Language->get('box_search_heading'))) . '<br />' .
	'</form>';
?>
<!-- end of CMS search -->

<?php
	if (isset($_GET['cmskeyword'])) {;
		$QcmsList = $osC_Cms->getsearchDetail($_GET['cmskeyword']);
	}
?>

<!-- start of wrapper module -->
<div class="moduleBox">

	<?php

		while ($QcmsList->next()) {
echo '<h3><br /><a href="' . osc_href_link(FILENAME_CMS, "view=" . $QcmsList->value("cms_id"), "NONSSL") . '"> ' . $QcmsList->value("cms_name") . '</a></h3>

<div class="content">
' . $QcmsList->value("cms_short_text") . ' ' . $osC_Language->get('cms_text_more') . '
<div><br />
<table cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="left">
<b><a href="' . osc_href_link(FILENAME_CMS, "view=" . $QcmsList->value("cms_id"), "NONSSL") . '"> ' . $osC_Language->get('cms_read_text_more') . '</a></b></td><td align="right">' . $QcmsList->value("date_added") .
'</td></table>
</div></div>';
		}
	?>
</div>
<!-- end of wrapper module -->

<!-- start of wrapper table -->

<div class="listingPageLinks">
	<span style="float: right;"><?php echo $QcmsList->getBatchPageLinks('page', null, true); ?></span>

	<?php echo $QcmsList->getBatchTotalPages($osC_Language->get('result_set_number_of_cms')); ?>
</div>

<!-- end of wrapper table -->