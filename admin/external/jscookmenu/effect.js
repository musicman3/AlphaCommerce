/*
	JSCookMenu Effect (c) Copyright 2002-2006 by Heng Yuan

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
function CMSpecialEffectInstance(a,b){a.show=!0;a.menu=b;this.effect=b.cmEffect=a}CMSpecialEffectInstance.prototype.canShow=function(a){if(a){if(this.effect.show)return!1;this.effect.show=!0}else if(!this.effect.show)return!1;return!0};CMSpecialEffectInstance.prototype.canHide=function(a){var b=this.effect;if(a){if(!b.show)return!1;b.show=!1}else if(b.show)return!1;return!0};CMSpecialEffectInstance.prototype.startShowing=function(){this.effect.menu.style.visibility="visible"}; CMSpecialEffectInstance.prototype.finishShowing=function(){};CMSpecialEffectInstance.prototype.finishHiding=function(){var a=this.effect.menu;a.style.visibility="hidden";a.style.top="0px";a.style.left="0px";a.cmEffect=null;a.cmOrient=null;this.effect.menu=null}; function CMSlidingEffectInstance(a,b,c){this.base=new CMSpecialEffectInstance(this,a);a.style.overflow="hidden";this.x=a.offsetLeft;this.y=a.offsetTop;b.charAt(0)=="h"?(this.slideOrient="h",this.slideDir=b.charAt(1)):(this.slideOrient="v",this.slideDir=b.charAt(2));this.speed=c;this.fullWidth=a.offsetWidth;this.fullHeight=a.offsetHeight;this.percent=0} CMSlidingEffectInstance.prototype.showEffect=function(a){if(this.base.canShow(a))a=this.percent,this.slideOrient=="h"?this.slideMenuV():this.slideMenuH(),a==0&&this.base.startShowing(),a<100?(this.percent+=this.speed,cmTimeEffect(this.menu.id,this.show,10)):this.show&&this.base.finishShowing()}; CMSlidingEffectInstance.prototype.hideEffect=function(a){if(this.base.canHide(a))if(a=this.percent,this.slideOrient=="h"?this.slideMenuV():this.slideMenuH(),a>0)this.percent-=this.speed,cmTimeEffect(this.menu.id,this.show,10);else if(!this.show)this.menu.style.clip="auto",this.base.finishHiding()}; CMSlidingEffectInstance.prototype.slideMenuH=function(){var a=this.percent;a<0&&(a=0);a>100&&(a=100);var b=this.fullWidth,c=this.fullHeight,e=this.x,a=a*b/100,d=this.menu;this.slideDir=="l"?(d.style.left=e+b-a+"px",d.style.clip="rect(0px "+a+"px "+c+"px 0px)"):(d.style.left=e-b+a+"px",d.style.clip="rect(0px "+b+"px "+c+"px "+(b-a)+"px)")}; CMSlidingEffectInstance.prototype.slideMenuV=function(){var a=this.percent;a<0&&(a=0);a>100&&(a=100);var b=this.fullWidth,c=this.fullHeight,e=this.y,a=a*c/100,d=this.menu;this.slideDir=="b"?(d.style.top=e-c+a+"px",d.style.clip="rect("+(c-a)+"px "+b+"px "+c+"px 0px)"):(d.style.top=e+c-a+"px",d.style.clip="rect(0px "+b+"px "+a+"px 0px)")};function CMSlidingEffect(a){a?a<=0?a=10:a>=100&&(a=100):a=10;this.speed=a} CMSlidingEffect.prototype.getInstance=function(a,b){return new CMSlidingEffectInstance(a,b,this.speed)};function CMFadingEffectInstance(a,b,c){this.base=new CMSpecialEffectInstance(this,a);a.style.overflow="hidden";this.showSpeed=b;this.hideSpeed=c;this.opacity=0} CMFadingEffectInstance.prototype.showEffect=function(a){if(this.base.canShow(a)){var a=this.menu,b=this.opacity;this.setOpacity();b==0&&this.base.startShowing();b<100?(this.opacity+=10,cmTimeEffect(a.id,this.show,this.showSpeed)):this.show&&this.base.finishShowing()}};CMFadingEffectInstance.prototype.hideEffect=function(a){if(this.base.canHide(a))a=this.menu,this.setOpacity(),this.opacity>0?(this.opacity-=10,cmTimeEffect(a.id,this.show,this.hideSpeed)):this.show||this.base.finishHiding()}; CMFadingEffectInstance.prototype.setOpacity=function(){this.menu.style.opacity=this.opacity/100};function CMFadingEffect(a,b){this.showSpeed=a;this.hideSpeed=b}CMFadingEffect.prototype.getInstance=function(a){return new CMFadingEffectInstance(a,this.showSpeed,this.hideSpeed)};