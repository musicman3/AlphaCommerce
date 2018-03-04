<?php
/*
  $Id: $
  
  author Gergely Tóth
  copyright 2010
  web http://oscommerce-extra.hu
  email: tgely_and_gumisarok.hu
 
  Filename xsell.php
  Desc Basic CMS system for osCommerce V3.0A5
  
  RuBiC modify (http://www.rubicshop.ru)
*/
?>
<div class="infoBoxHeading"><?php echo osc_icon('application-x-ar.png') . ' ' . $osC_Template->getPageTitle();?></div>
<div class="infoBoxContent">
<h1><?php echo $osC_Language->get('access_products_xsell_title'); ?></h1>
<?php

  if ( $osC_MessageStack->size($osC_Template->getModule()) > 0 ) {
    echo $osC_MessageStack->get($osC_Template->getModule());
  }
  
?>
<!-- Start of cross sale //-->
<p align="left"><?php echo '<input type="button" value="' . $osC_Language->get('button_products_module') . '" onclick="document.location.href=\'' . osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule()) . '\';" class="operationButton" />'; ?></p>
<table width="100%" border="0" cellpadding="0"  cellspacing="0">
<tr><td align=left>

<?php

// *************************************************************************************************************************************  
// Draw category pull down menu   
    if (isset($_GET['add_related_products_ID']) && !$_POST && !isset($_GET['sort'])) {

        echo "<div align=\"right\"><form name=\"xsellcategories\" action=\"#\" method=\"post\">";
        echo "<input type=\"hidden\" name=\"add_related_products_ID\" value=\"" . $_GET['add_related_products_ID'] . "\" />";
        $current_category_id = 1;
        echo $osC_Language->get('select_category') . ":&nbsp;" . osc_draw_pull_down_menu('cPath', osC_xproducts_Admin::category_tree(), $current_category_id, null, null);
        
        // need one select submit button
        
            echo "&nbsp;&nbsp;" . osc_draw_hidden_field('subaction', 'categories_confirm') .
            '<input type="submit" value="' . $osC_Language->get('button_category_select') .
           '" class="operationButton" onclick="' .
           (isset($osC_ObjectInfo) ? 'setFileUploadField(); ' : '') .
           'document.xsellcategories.target=\'_self\'; document.xsellcategories.action=\'' .
           osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() .
           '&action=xsell&cPath=4&add_related_products_ID=' .
           $_GET['add_related_products_ID']) . '\';" />';

        echo "</form></div>\n\n";

    }
    
    if (isset($_GET['cPath'])) {

    
            echo "<table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" style=\"color:#FFFFFF\" bgcolor=\"#1D65A4\">\n";
            echo "<form name=\"xsellsave\" action=\"#\" method=\"post\">\n";
            echo "<tr class=\"dataTableHeadingRow\">\n";
            echo "\t<td align=\"center\" class=\"dataTableHeadingContent\">". osc_icon('checkbox_ticked.gif') ."</td>\n";
            echo "\t<td class=\"dataTableHeadingContent\" align='center' nowrap><b>ID</b></td>\n";
            echo "\t<td class=\"dataTableHeadingContent\"align='center' nowrap><b>" . $osC_Language->get('heading_product_name') . "</b></td>\n";
            echo "\t<td class=\"dataTableHeadingContent\"align='center' nowrap><b>" . $osC_Language->get('heading_product_active') . "</b></td>\n";
            echo "</tr>\n";
    

            $XprodList = $osC_Database->query('select p.products_id, p.products_status, pd.products_name, pd.products_description, pd.products_url from :table_products p, :table_products_description pd, :table_products_to_categories p2c where p2c.categories_id= :cat_id and pd.products_id = p.products_id and p2c.products_id=p.products_id and pd.language_id = :language_id order by pd.products_name ');
            $XprodList->bindTable(':table_products', TABLE_PRODUCTS);
            $XprodList->bindTable(':table_products_description', TABLE_PRODUCTS_DESCRIPTION);
            $XprodList->bindTable(':table_products_to_categories', TABLE_PRODUCTS_TO_CATEGORIES);            
            $XprodList->bindInt(':cat_id', $_GET['cPath']);
            $XprodList->bindInt(':language_id', $osC_Language->getID());           
            
            $XprodList->execute();
            
             $num_of_products = $XprodList->numberOfRows();

             $products_id[] = array();
             $products_name[] = array();
             $products_status[] = array();
                $p = 0;
                
                while ( $XprodList->next() ) {
                        $products_id[$p] = $XprodList->valueInt('products_id');
                        $products_name[$p] = $XprodList->value('products_name');
                        $products_status[$p] = $XprodList->value('products_status');
                    $p++;           
                }

                $XproductsList = $osC_Database->query('select products_xsell_id from :table_products_xsell where products_id = :add_related_products_id');
                $XproductsList->bindTable(':table_products_xsell', TABLE_PRODUCTS_XSELL);
                $XproductsList->bindInt(':add_related_products_id', $_GET['add_related_products_ID']);
                $XproductsList->execute();                

                $xsell_id_pr[] = array();
                $pc = 0;
                
                while ( $XproductsList->next() ) {
                        $xsell_id_pr[$pc] = $XproductsList->valueInt('products_xsell_id');
                        $pc++;
                }

                    for ($i=0; $i < $num_of_products; $i++) {
 
                           
                        echo "<tr style=\"color:#000000\" bgcolor=\"#F5F5F5\">\n";
                        echo "\t<td align=\"center\" class=\"dataTableContent\">";
                    
                        echo "<input "; /* this is to see it it is in the DB */
                        $run_update=false; // set to false to insert new entry in the DB
                        if ($xsell_id_pr) {
                        
                            foreach ($xsell_id_pr as $compare_checked) { 
                                if ($products_id[$i]===$compare_checked) {
                                    echo "checked ";
                                    $run_update=true;
                                }
                            }
                        } 
						if ($products_status[$i]=='0') {
						$statusline=osc_icon('checkbox_crossed.gif');
						}
						if ($products_status[$i]=='1') {
						$statusline=osc_icon('checkbox_ticked.gif');
						}
                        echo "size=\"20\" name=\"products_xsell_id[]\" type=\"checkbox\" value=\"";
                        echo $products_id[$i] . "\"></td>\n";
                    
                        echo "\t<td class=\"dataTableContent\" align=center>" . $products_id[$i] . "</td>\n"
                        ."\t<td class=\"dataTableContent\">".$products_name[$i]."</td>\n";
                        echo "\t<td class=\"dataTableContent\" align=center>" . $statusline . "</td>\n";
                        echo "</tr>\n";
                    }
                    
                    echo "<tr>\n";
                    echo "\t<td>&nbsp;</td>\n";
                    echo "\t<td>&nbsp;</td>\n";
                    echo "\t<td bgcolor=\"#1D65A4\">\n";
                    
            // rest of hidden data list
                    echo '<div style="display:none">';

                    $result = array_diff($xsell_id_pr, $products_id);
                    $x = array($result);
                    $labels =array($x);
                    ksort($labels);            
                    $xx = array_values($labels);
                    $long = count($labels);

                    for ($i=1; $i < $long; $i++) {
                        echo '<input type="checkbox" name="products_xsell_id[]" value="' . $xx[$i] . '" checked>';             
                    }

                    echo '</div>';
            // end of hidden data list

                        echo '<input type="hidden" name="run_update" value="'; 
                        if ($run_update==true) echo "true"; else echo "false";
                        echo '" />';
              echo "</table>\n";        
            echo osc_draw_hidden_field('subaction', 'save_confirm') .
           '<div align="center"><input type="submit" value="' . $osC_Language->get('button_save') .
           '" class="operationButton" onclick="' .
           (isset($osC_ObjectInfo) ? 'setFileUploadField(); ' : '') .
           'document.xsellsave.target=\'_self\'; document.xsellsave.action=\'' .
           osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() .
           '&action=xsell&add_related_products_ID=' .
           $_GET['add_related_products_ID']) . '\';" /></td>';
           
                echo "</tr>\n";
              echo "</div></form>\n";
            
        }


// *******************************************************************************************************************************
    
    if (isset($_GET['sort']) && ($_GET['sort']==1)) {
        echo '<form name="xsellsort" action="#" method="post" enctype="multipart/form-data">';
              echo '<table width="100%" cellpadding="3" cellspacing="1" bgcolor="#1D65A4" border="0">';
                echo '<tr class="dataTableHeadingRow">';
                  echo '<td style="color:#FFFFFF" class="dataTableHeadingContent" align="center" nowrap><b>ID</b></td>';
                  echo '<td style="color:#FFFFFF" class="dataTableHeadingContent" align="center" nowrap><b>' . $osC_Language->get('heading_product_name') . '</b></td>';
                  echo '<td style="color:#FFFFFF" class="dataTableHeadingContent" align="center" nowrap><b>' . $osC_Language->get('heading_product_order') . '</b></td>';
                echo '</tr>';
                
                $XarticleList = $osC_Database->query('select products_xsell_id, sort_order from :table_products_xsell where products_id = :add_related_products_id');
                $XarticleList->bindTable(':table_products_xsell', TABLE_PRODUCTS_XSELL);
                $XarticleList->bindInt(':add_related_products_id', $_GET['add_related_products_ID']);
                $XarticleList->execute();
                
                $ordering_size = $XarticleList->numberOfRows();
                $articles_data = array();                
                $i=0;                

                while ($XarticleList->next()) {
                  array_push($articles_data, $XarticleList->value('sort_order'));                  

                    $XarticlepList = $osC_Database->query('select p.products_id, pd.products_name, pd.products_description
                                                           from :table_products p, :table_productsdesc pd
                                                           where pd.products_id = p.products_id and pd.language_id = :language_id and
                                                           p.products_id = :prod_xsellid');
                    $XarticlepList->bindTable(':table_products', TABLE_PRODUCTS);
                    $XarticlepList->bindTable(':table_productsdesc', TABLE_PRODUCTS_DESCRIPTION);
                    $XarticlepList->bindInt(':language_id', $osC_Language->getID()); //for this query                    
                    $XarticlepList->bindInt(':prod_xsellid', $XarticleList->value('products_xsell_id'));
                    $XarticlepList->execute();
              
                    echo '<tr class="dataTableContentRow" bgcolor="#FFFFFF">';
                    echo '<td class="dataTableContent" align="center" nowrap>' . $XarticlepList->value('products_id') . '</td>';
                      echo '<td class="dataTableContent" align="left" nowrap>&nbsp;&nbsp;&nbsp;' . $XarticlepList->value('products_name') . '</td>';                    
                      echo '<td class="dataTableContent" align="center" nowrap"><select name="' . $XarticlepList->value('products_id') . '">';
                           for ($y=1;$y<=$ordering_size;$y++) {
                                echo "<option value=\"$y\"";
                                    if (!(strcmp($y, "$articles_data[$i]"))) {echo " SELECTED";}
                                    echo ">$y</option>";
                            }
                        echo '</select></td>';
                    echo '</tr>';
                    $i++;
                    
                } // the end of while

                echo '<tr>';
                echo '<td>&nbsp;</td>';
				                  echo '<td>&nbsp;</td>';
                echo '</tr>';
              echo '</table>    </td>
</tr>';
			  
                 
            echo '<td align="center">' . osc_draw_hidden_field('subaction', 'sort_confirm') .          //a rejtett adatok
           '<br /><input type="submit" value="' . $osC_Language->get('button_save') .         //a submit gomb készítése nyelv függõ felirattal
           '" class="operationButton" onclick="' .                                      //a gomb CSS kinézete és benyomása
           (isset($osC_ObjectInfo) ? 'setFileUploadField(); ' : '') .
           'document.xsellsort.target=\'_self\'; document.xsellsort.action=\'' .            //
           osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() .           //url oldal saját cím 1
           '&action=xsell&sort=1&add_related_products_ID=' .
           $_GET['add_related_products_ID']) . '\';" /> <input type="button" value="' .  //modulhoz kapcsolt mûvelet vége és gomb elõkészítés
           $osC_Language->get('button_back') .                                        //Nyelvi hivatkozás a gombra
           '" onclick="document.location.href=\'' .                                     //a gomb benyomására végrehajtot mûvelet
           osc_href_link_admin(FILENAME_DEFAULT, $osC_Template->getModule() .           //a gomb benyomása esetén betöltõdõ oldal
           '&action=xsell') .                                                           //oscAdmin út
           '\';" class="operationButton" /></td>';                                      //CSS gomb kinézet
                         
                  

            echo '</form>';
    
    }
?>
    <!-- End of cross sale //-->
</table></div>
<!-- body_text_eof //-->