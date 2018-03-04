/*
	JSCookMenu v2.0.4 (c) Copyright 2002-2006 by Heng Yuan

	http://jscook.sourceforge.net/JSCookMenu/

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including without limitation
	the rights to use, copy, modify, merge, publish, distribute, sublicense,
	and/or sell copies of the Software, and to permit persons to whom the
	Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	ITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
	DEALINGS IN THE SOFTWARE.
*/
var _cmNodeProperties={prefix:"",mainFolderLeft:"",mainFolderRight:"",mainItemLeft:"",mainItemRight:"",folderLeft:"",folderRight:"",itemLeft:"",itemRight:"",mainSpacing:0,subSpacing:0,delay:500,zIndexStart:1E3,zIndexInc:5,subMenuHeader:null,subMenuFooter:null,offsetHMainAdjust:[0,0],offsetVMainAdjust:[0,0],offsetSubAdjust:[0,0],clickOpen:1,effect:null},_cmIDCount=0,_cmIDName="cmSubMenuID",_cmTimeOut=null,_cmCurrentItem=null,_cmNoAction={},_cmNoClick={},_cmSplit={},_cmMenuList=[],_cmItemList=[],_cmFrameList= [],_cmFrameListSize=0,_cmFrameIDCount=0,_cmFrameMasking=!0,_cmClicked=!1,_cmHideObjects=0;function cmClone(a){var c={};for(v in a)c[v]=a[v];return c}function cmAllocMenu(a,c,b,d,e){var f={};f.div=a;f.menu=c;f.orient=b;f.nodeProperties=d;f.prefix=e;a=_cmMenuList.length;_cmMenuList[a]=f;return a} function cmAllocFrame(){if(_cmFrameListSize>0)return cmGetObject(_cmFrameList[--_cmFrameListSize]);var a=document.createElement("iframe"),c=_cmFrameIDCount++;a.id="cmFrame"+c;a.frameBorder="0";a.style.display="none";a.src="javascript:false";document.body.appendChild(a);a.style.filter="alpha(opacity=0)";a.style.zIndex=99;a.style.position="absolute";a.style.border="0";a.scrolling="no";return a}function cmFreeFrame(a){_cmFrameList[_cmFrameListSize++]=a.id} function cmNewID(){return _cmIDName+ ++_cmIDCount}function cmActionItem(a,c,b,d,e){_cmItemList[_cmItemList.length]=a;a=_cmItemList.length-1;d=d.nodeProperties.clickOpen;b="this,"+c+","+(!b?"null":"'"+b+"'")+","+e+","+a;return(d==3||d==2&&c?' onmouseover="cmItemMouseOver('+b+',false)" onmousedown="cmItemMouseDownOpenSub ('+b+')"':' onmouseover="cmItemMouseOverOpenSub ('+b+')" onmousedown="cmItemMouseDown ('+b+')"')+' onmouseout="cmItemMouseOut ('+b+')" onmouseup="cmItemMouseUp ('+b+')"'} function cmNoClickItem(a,c,b,d,e){_cmItemList[_cmItemList.length]=a;a=_cmItemList.length-1;c="this,"+c+","+(!b?"null":"'"+b+"'")+","+e+","+a;return' onmouseover="cmItemMouseOver ('+c+')" onmouseout="cmItemMouseOut ('+c+')"'}function cmNoActionItem(a){return a[1]}function cmSplitItem(a,c,b){a="cm"+a;c?(a+="Main",a+=b?"HSplit":"VSplit"):a+="HSplit";return eval(a)} function cmDrawSubMenu(a,c,b,d,e,f,h){var g='<div class="'+c+'SubMenu" id="'+b+'" style="z-index: '+e+';position: absolute; top: 0px; left: 0px;">';d.subMenuHeader&&(g+=d.subMenuHeader);g+='<table summary="sub menu" id="'+b+'Table" cellspacing="'+d.subSpacing+'" class="'+c+'SubMenuTable">';var j="",k,m,l,o,n;for(o=5;o<a.length;++o)if(k=a[o])k==_cmSplit&&(k=cmSplitItem(c,0,!0)),k.parentItem=a,k.subMenuID=b,m=(l=k.length>5)?cmNewID():null,g+='<tr class="'+c+'MenuItem"',g+=k[0]!=_cmNoClick?cmActionItem(k, 0,m,f,h):cmNoClickItem(k,0,m,f,h),g+=">",k[0]==_cmNoAction||k[0]==_cmNoClick?(g+=cmNoActionItem(k),g+="</tr>"):(n=c+"Menu",n+=l?"Folder":"Item",g+='<td class="'+n+'Left">',g+=k[0]!=null?k[0]:l?d.folderLeft:d.itemLeft,g+='</td><td class="'+n+'Text">'+k[1],g+='</td><td class="'+n+'Right">',l?(g+=d.folderRight,j+=cmDrawSubMenu(k,c,m,d,e+d.zIndexInc,f,h)):g+=d.itemRight,g+="</td></tr>");g+="</table>";d.subMenuFooter&&(g+=d.subMenuFooter);g+="</div>"+j;return g} function cmDraw(a,c,b,d,e){var f=cmGetObject(a);if(!e)e=d.prefix;e||(e="");d||(d=_cmNodeProperties);b||(b="hbr");var h=cmAllocMenu(a,c,b,d,e),g=_cmMenuList[h];if(!d.delay)d.delay=_cmNodeProperties.delay;if(!d.clickOpen)d.clickOpen=_cmNodeProperties.clickOpen;if(!d.zIndexStart)d.zIndexStart=_cmNodeProperties.zIndexStart;if(!d.zIndexInc)d.zIndexInc=_cmNodeProperties.zIndexInc;if(!d.offsetHMainAdjust)d.offsetHMainAdjust=_cmNodeProperties.offsetHMainAdjust;if(!d.offsetVMainAdjust)d.offsetVMainAdjust= _cmNodeProperties.offsetVMainAdjust;if(!d.offsetSubAdjust)d.offsetSubAdjust=_cmNodeProperties.offsetSubAdjust;g.cmFrameMasking=_cmFrameMasking;var j='<table summary="main menu" class="'+e+'Menu" cellspacing="'+d.mainSpacing+'">',k="";b.charAt(0)=="h"?(j+="<tr>",b=!1):b=!0;var m,l,o,n,p;for(m=0;m<c.length;++m)if(l=c[m])l.menu=c,l.subMenuID=a,j+=b?"<tr":"<td",j+=' class="'+e+'MainItem"',o=(n=l.length>5)?cmNewID():null,j+=cmActionItem(l,1,o,g,h)+">",l==_cmSplit&&(l=cmSplitItem(e,1,b)),l[0]==_cmNoAction|| l[0]==_cmNoClick?(j+=cmNoActionItem(l),j+=b?"</tr>":"</td>"):(p=e+"Main"+(n?"Folder":"Item"),j+=b?"<td":"<span",j+=' class="'+p+'Left">',j+=l[0]==null?n?d.mainFolderLeft:d.mainItemLeft:l[0],j+=b?"</td>":"</span>",j+=b?"<td":"<span",j+=' class="'+p+'Text">',j+=l[1],j+=b?"</td>":"</span>",j+=b?"<td":"<span",j+=' class="'+p+'Right">',j+=n?d.mainFolderRight:d.mainItemRight,j+=b?"</td>":"</span>",j+=b?"</tr>":"</td>",n&&(k+=cmDrawSubMenu(l,e,o,d,d.zIndexStart,g,h)));b||(j+="</tr>");j+="</table>"+k;f.innerHTML= j}function cmDrawFromText(a,c,b,d){for(var e=null,f=cmGetObject(a).firstChild;f;f=f.nextSibling)if(f.tagName){var h=f.tagName.toLowerCase();if(!(h!="ul"&&h!="ol")){e=cmDrawFromTextSubMenu(f);break}}e&&cmDraw(a,e,c,b,d)} function cmDrawFromTextSubMenu(a){for(var c=[],a=a.firstChild;a;a=a.nextSibling)if(a.tagName&&a.tagName.toLowerCase()=="li")if(a.firstChild==null)c[c.length]=_cmSplit;else{for(var b=[],d=a.firstChild,e=!1;d;d=d.nextSibling)if(d.tagName){if(d.className=="cmNoClick"){b[0]=_cmNoClick;b[1]=getActionHTML(d);e=!0;break}if(d.className=="cmNoAction"){b[0]=_cmNoAction;b[1]=getActionHTML(d);e=!0;break}var f=d.tagName.toLowerCase();if(f=="span"){b[0]=d.firstChild?d.innerHTML:null;d=d.nextSibling;break}}if(e)c[c.length]= b;else if(d){for(;d;d=d.nextSibling)if(d.tagName){f=d.tagName.toLowerCase();if(f=="a")b[1]=d.innerHTML,b[2]=d.href,b[3]=d.target,b[4]=d.title,b[4]==""&&(b[4]=null);else if(f=="span"||f=="div")b[1]=d.innerHTML,b[2]=null,b[3]=null,b[4]=null;break}for(;d;d=d.nextSibling)if(d.tagName&&(f=d.tagName.toLowerCase(),!(f!="ul"&&f!="ol"))){d=cmDrawFromTextSubMenu(d);for(i=0;i<d.length;++i)b[i+5]=d[i];break}c[c.length]=b}}return c} function getActionHTML(a){for(a=a.firstChild;a;a=a.nextSibling)if(a.tagName&&a.tagName.toLowerCase()=="table")break;if(!a)return"<td></td><td></td><td></td>";for(a=a.firstChild;a;a=a.nextSibling)if(a.tagName&&a.tagName.toLowerCase()=="tbody")break;if(!a)return"<td></td><td></td><td></td>";for(a=a.firstChild;a;a=a.nextSibling)if(a.tagName&&a.tagName.toLowerCase()=="tr")break;if(!a)return"<td></td><td></td><td></td>";return a.innerHTML} function cmGetMenuItem(a){if(!a.subMenuID)return null;var c=cmGetObject(a.subMenuID);if(a.menu){var b=a.menu,c=c.firstChild.firstChild.firstChild.firstChild,d;for(d=0;d<b.length;++d){if(b[d]==a)return c;c=c.nextSibling}}else if(a.parentItem){b=a.parentItem;c=cmGetObject(a.subMenuID+"Table");if(!c)return null;c=c.firstChild.firstChild;for(d=5;d<b.length;++d){if(b[d]==a)return c;c=c.nextSibling}}return null} function cmDisableItem(a,c){if(a){var b=cmGetMenuItem(a);if(b)b.className=a.menu?c+"MainItemDisabled":c+"MenuItemDisabled",a.isDisabled=!0}}function cmEnableItem(a,c){if(a&&cmGetMenuItem(a))menu.className=a.menu?c+"MainItem":c+"MenuItem",a.isDisabled=!1} function cmItemMouseOver(a,c,b,d,e,f){if(!f&&_cmClicked)cmItemMouseOverOpenSub(a,c,b,d,e);else if(clearTimeout(_cmTimeOut),!_cmItemList[e].isDisabled){f=_cmMenuList[d].prefix;if(!a.cmMenuID)a.cmMenuID=d,a.cmIsMain=c;d=cmGetThisMenu(a,f);if(!d.cmItems)d.cmItems=[];var h;for(h=0;h<d.cmItems.length;++h)if(d.cmItems[h]==a)break;h==d.cmItems.length&&(d.cmItems[h]=a);if(_cmCurrentItem){if(_cmCurrentItem==a||_cmCurrentItem==d){b=_cmItemList[e];cmSetStatus(b);return}h=_cmMenuList[_cmCurrentItem.cmMenuID]; var g=h.prefix,j=cmGetThisMenu(_cmCurrentItem,g);if(j!=d.cmParentMenu)_cmCurrentItem.className=_cmCurrentItem.cmIsMain?g+"MainItem":g+"MenuItem",j.id!=b&&cmHideMenu(j,d,h)}_cmCurrentItem=a;cmResetMenu(d,f);b=_cmItemList[e];if(cmIsDefaultItem(b))a.className=c?f+"MainItemHover":f+"MenuItemHover";cmSetStatus(b)}}function cmItemMouseOverOpenSub(a,c,b,d,e){clearTimeout(_cmTimeOut);_cmItemList[e].isDisabled||(cmItemMouseOver(a,c,b,d,e,!0),b&&(b=cmGetObject(b),cmShowSubMenu(a,c,b,_cmMenuList[d])))} function cmItemMouseOut(a,c,b,d){_cmTimeOut=window.setTimeout("cmHideMenuTime ()",_cmMenuList[d].nodeProperties.delay);window.defaultStatus=""}function cmItemMouseDown(a,c,b,d,e){if(!_cmItemList[e].isDisabled&&cmIsDefaultItem(_cmItemList[e]))c=_cmMenuList[d].prefix,a.className=a.cmIsMain?c+"MainItemActive":c+"MenuItemActive"}function cmItemMouseDownOpenSub(a,c,b,d,e){_cmItemList[e].isDisabled||(_cmClicked=!0,cmItemMouseDown(a,c,b,d,e),b&&(b=cmGetObject(b),cmShowSubMenu(a,c,b,_cmMenuList[d])))} function cmItemMouseUp(a,c,b,d,e){if(!_cmItemList[e].isDisabled)if(c=_cmItemList[e],b=null,e="_self",c.length>2&&(b=c[2]),c.length>3&&c[3]&&(e=c[3]),b!=null&&(_cmClicked=!1,window.open(b,e)),d=_cmMenuList[d],b=d.prefix,e=cmGetThisMenu(a,b),c.length>5){if(cmIsDefaultItem(c))a.className=a.cmIsMain?b+"MainItemHover":b+"MenuItemHover"}else{if(cmIsDefaultItem(c))a.className=a.cmIsMain?b+"MainItem":b+"MenuItem";cmHideMenu(e,null,d)}} function cmMoveSubMenu(a,c,b,d){var e=d.orient,d=c?e.charAt(0)=="h"?d.nodeProperties.offsetHMainAdjust:d.nodeProperties.offsetVMainAdjust:d.nodeProperties.offsetSubAdjust;!c&&e.charAt(0)=="h"&&(e="v"+e.charAt(1)+e.charAt(2));var c=String(e),f=b.offsetParent,h=cmGetWidth(b),g=cmGetHorizontalAlign(a,c,f,h);c.charAt(0)=="h"?(b.style.top=c.charAt(1)=="b"?cmGetYAt(a,f)+cmGetHeight(a)+d[1]+"px":cmGetYAt(a,f)-cmGetHeight(b)-d[1]+"px",b.style.left=g=="r"?cmGetXAt(a,f)+d[0]+"px":cmGetXAt(a,f)+cmGetWidth(a)- h-d[0]+"px"):(b.style.left=g=="r"?cmGetXAt(a,f)+cmGetWidth(a)+d[0]+"px":cmGetXAt(a,f)-h-d[0]+"px",b.style.top=c.charAt(1)=="b"?cmGetYAt(a,f)+d[1]+"px":cmGetYAt(a,f)+cmGetHeight(a)-cmGetHeight(b)+d[1]+"px");g!=e.charAt(2)&&(e=e.charAt(0)+e.charAt(1)+g);return e} function cmGetHorizontalAlign(a,c,b,d){var e=c.charAt(2);if(!document.body)return e;var f=document.body,h;if(window.innerWidth)h=window.pageXOffset,f=window.innerWidth+h;else if(f.clientWidth)h=f.clientLeft,f=f.clientWidth+h;else return e;c.charAt(0)=="h"?(e=="r"&&cmGetXAt(a)+d>f&&(e="l"),e=="l"&&cmGetXAt(a)+cmGetWidth(a)-d<h&&(e="r")):(e=="r"&&cmGetXAt(a,b)+cmGetWidth(a)+d>f&&(e="l"),e=="l"&&cmGetXAt(a,b)-d<h&&(e="r"));return e} function cmShowSubMenu(a,c,b,d){var e=d.prefix;if(!b.cmParentMenu){e=cmGetThisMenu(a,e);b.cmParentMenu=e;if(!e.cmSubMenu)e.cmSubMenu=[];e.cmSubMenu[e.cmSubMenu.length]=b}if(e=b.cmEffect)e.showEffect(!0);else{a=cmMoveSubMenu(a,c,b,d);b.cmOrient=a;c=!1;if(b.style.visibility!="visible"&&d.nodeProperties.effect)try{e=d.nodeProperties.effect.getInstance(b,a),e.showEffect(!1)}catch(f){c=!0,b.cmEffect=null}else c=!0;if(c)b.style.visibility="visible"}if(!_cmHideObjects){_cmHideObjects=2;try{window.opera&& parseInt(navigator.appVersion)<9&&(_cmHideObjects=1)}catch(h){}}if(_cmHideObjects==1){if(!b.cmOverlap)b.cmOverlap=[];cmHideControl("IFRAME",b);cmHideControl("OBJECT",b)}}function cmResetMenu(a,c){if(a.cmItems){var b,d,e=a.cmItems;for(b=0;b<e.length;++b){if(e[b].cmIsMain){if(e[b].className==c+"MainItemDisabled")continue}else if(e[b].className==c+"MenuItemDisabled")continue;d=e[b].cmIsMain?c+"MainItem":c+"MenuItem";if(e[b].className!=d)e[b].className=d}}} function cmHideMenuTime(){_cmClicked=!1;if(_cmCurrentItem){var a=_cmMenuList[_cmCurrentItem.cmMenuID];cmHideMenu(cmGetThisMenu(_cmCurrentItem,a.prefix),null,a);_cmCurrentItem=null}}function cmHideThisMenu(a){var c=a.cmEffect;c?c.hideEffect(!0):(a.style.visibility="hidden",a.style.top="0px",a.style.left="0px",a.cmOrient=null);cmShowControl(a);a.cmItems=null} function cmHideMenu(a,c,b){var d=b.prefix,e=d+"SubMenu";if(a.cmSubMenu){var f;for(f=0;f<a.cmSubMenu.length;++f)cmHideSubMenu(a.cmSubMenu[f],b)}for(;a&&a!=c;){cmResetMenu(a,d);if(a.className==e)cmHideThisMenu(a,b);else break;a=cmGetThisMenu(a.cmParentMenu,d)}}function cmHideSubMenu(a,c){if(a.style.visibility!="hidden"){if(a.cmSubMenu){var b;for(b=0;b<a.cmSubMenu.length;++b)cmHideSubMenu(a.cmSubMenu[b],c)}cmResetMenu(a,c.prefix);cmHideThisMenu(a,c)}} function cmHideControl(a,c){var b=cmGetX(c),d=cmGetY(c),e=c.offsetWidth,f=c.offsetHeight,h;for(h=0;h<document.all.tags(a).length;++h){var g=document.all.tags(a)[h];if(g&&g.offsetParent){var j=cmGetX(g),k=cmGetY(g),m=g.offsetWidth,l=g.offsetHeight;if(!(j>b+e||j+m<b))if(!(k>d+f||k+l<d)&&g.style.visibility!="hidden")c.cmOverlap[c.cmOverlap.length]=g,g.style.visibility="hidden"}}} function cmShowControl(a){if(a.cmOverlap){var c;for(c=0;c<a.cmOverlap.length;++c)a.cmOverlap[c].style.visibility=""}a.cmOverlap=null}function cmGetThisMenu(a,c){for(var b=c+"SubMenu",d=c+"Menu";a;){if(a.className==b||a.className==d)return a;a=a.parentNode}return null}function cmTimeEffect(a,c,b){window.setTimeout('cmCallEffect("'+a+'",'+c+")",b)}function cmCallEffect(a,c){var b=cmGetObject(a);if(b&&b.cmEffect)try{c?b.cmEffect.showEffect(!1):b.cmEffect.hideEffect(!1)}catch(d){}} function cmIsDefaultItem(a){if(a==_cmSplit||a[0]==_cmNoAction||a[0]==_cmNoClick)return!1;return!0}function cmGetObject(a){if(document.all)return document.all[a];return document.getElementById(a)}function cmGetWidth(a){var c=a.offsetWidth;if(c>0||!cmIsTRNode(a))return c;if(!a.firstChild)return 0;return a.lastChild.offsetLeft-a.firstChild.offsetLeft+cmGetWidth(a.lastChild)} function cmGetHeight(a){var c=a.offsetHeight;if(c>0||!cmIsTRNode(a))return c;if(!a.firstChild)return 0;return a.firstChild.offsetHeight}function cmGetX(a){if(!a)return 0;var c=0;do c+=a.offsetLeft,a=a.offsetParent;while(a);return c}function cmGetXAt(a,c){for(var b=0;a&&a!=c;)b+=a.offsetLeft,a=a.offsetParent;if(a==c)return b;return b-cmGetX(c)}function cmGetY(a){if(!a)return 0;var c=0;do c+=a.offsetTop,a=a.offsetParent;while(a);return c} function cmIsTRNode(a){a=a.tagName;return a=="TR"||a=="tr"||a=="Tr"||a=="tR"}function cmGetYAt(a,c){var b=0;if(!a.offsetHeight&&cmIsTRNode(a)){var d=a.parentNode.firstChild,a=a.firstChild;b-=d.firstChild.offsetTop}for(;a&&a!=c;)b+=a.offsetTop,a=a.offsetParent;if(a==c)return b;return b-cmGetY(c)}function cmSetStatus(a){var c="";a.length>4?c=a[4]!=null?a[4]:a[2]?a[2]:c:a.length>2&&(c=a[2]?a[2]:c);window.defaultStatus=c} function cmGetProperties(a){if(a==void 0)return"undefined";if(a==null)return"null";var c=a+":\n",b;for(b in a)c+=b+" = "+a[b]+"; ";return c};