/* Flot plugin for automatically redrawing plots as the placeholder resizes.

Copyright (c) 2007-2013 IOLA and Ole Laursen.
Licensed under the MIT license.

It works by listening for changes on the placeholder div (through the jQuery
resize event plugin) - if the size changes, it will redraw the plot.

There are no options. If you need to disable the plugin for some plots, you
can just fix the size of their placeholders.

*/
/* Inline dependency:
 * jQuery resize event - v1.1 - 3/14/2010
 * http://benalman.com/projects/jquery-resize-plugin/
 *
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
!function(e,t,i){function n(){for(var i=r.length-1;i>=0;i--){var s=e(r[i]);if(s[0]==t||s.is(":visible")){var d=s.width(),f=s.height(),v=s.data(h);!v||d===v.w&&f===v.h?o[m]=o[l]:(o[m]=o[c],s.trigger(u,[v.w=d,v.h=f]))}else v=s.data(h),v.w=0,v.h=0}null!==a&&(a=t.requestAnimationFrame(n))}var a,r=[],o=e.resize=e.extend(e.resize,{}),s="setTimeout",u="resize",h=u+"-special-event",m="delay",l="pendingDelay",c="activeDelay",d="throttleWindow";o[l]=250,o[c]=20,o[m]=o[l],o[d]=!0,e.event.special[u]={setup:function(){if(!o[d]&&this[s])return!1;var t=e(this);r.push(this),t.data(h,{w:t.width(),h:t.height()}),1===r.length&&(a=i,n())},teardown:function(){if(!o[d]&&this[s])return!1;for(var t=e(this),i=r.length-1;i>=0;i--)if(r[i]==this){r.splice(i,1);break}t.removeData(h),r.length||(cancelAnimationFrame(a),a=null)},add:function(t){function n(t,n,r){var o=e(this),s=o.data(h);s.w=n!==i?n:o.width(),s.h=r!==i?r:o.height(),a.apply(this,arguments)}if(!o[d]&&this[s])return!1;var a;return e.isFunction(t)?(a=t,n):(a=t.handler,void(t.handler=n))}},t.requestAnimationFrame||(t.requestAnimationFrame=function(){return t.webkitRequestAnimationFrame||t.mozRequestAnimationFrame||t.oRequestAnimationFrame||t.msRequestAnimationFrame||function(e){return t.setTimeout(e,o[m])}}()),t.cancelAnimationFrame||(t.cancelAnimationFrame=function(){return t.webkitCancelRequestAnimationFrame||t.mozCancelRequestAnimationFrame||t.oCancelRequestAnimationFrame||t.msCancelRequestAnimationFrame||clearTimeout}())}(jQuery,this),function(e){function t(e){function t(){var t=e.getPlaceholder();0!=t.width()&&0!=t.height()&&(e.resize(),e.setupGrid(),e.draw())}function i(e){e.getPlaceholder().resize(t)}function n(e){e.getPlaceholder().unbind("resize",t)}e.hooks.bindEvents.push(i),e.hooks.shutdown.push(n)}var i={};e.plot.plugins.push({init:t,options:i,name:"resize",version:"1.0"})}(jQuery);