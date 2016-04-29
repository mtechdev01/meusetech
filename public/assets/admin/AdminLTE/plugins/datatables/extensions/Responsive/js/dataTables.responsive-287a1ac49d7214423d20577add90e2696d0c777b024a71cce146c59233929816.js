/*! Responsive 1.0.6
 * 2014-2015 SpryMedia Ltd - datatables.net/license
 */
/**
 * @summary     Responsive
 * @description Responsive tables plug-in for DataTables
 * @version     1.0.6
 * @file        dataTables.responsive.js
 * @author      SpryMedia Ltd (www.sprymedia.co.uk)
 * @contact     www.sprymedia.co.uk/contact
 * @copyright   Copyright 2014-2015 SpryMedia Ltd.
 *
 * This source file is free software, available under the following license:
 *   MIT license - http://datatables.net/license/mit
 *
 * This source file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
 *
 * For details please refer to: http://www.datatables.net
 */
!function(e,t){var n=function(n,i){"use strict";var r=function(e,t){if(!i.versionCheck||!i.versionCheck("1.10.1"))throw"DataTables Responsive requires DataTables 1.10.1 or newer";this.s={dt:new i.Api(e),columns:[]},this.s.dt.settings()[0].responsive||(t&&"string"==typeof t.details&&(t.details={type:t.details}),this.c=n.extend(!0,{},r.defaults,i.defaults.responsive,t),e.responsive=this,this._constructor())};r.prototype={_constructor:function(){var t=this,i=this.s.dt;i.settings()[0]._responsive=this,n(e).on("resize.dtr orientationchange.dtr",i.settings()[0].oApi._fnThrottle(function(){t._resize()})),i.on("destroy.dtr",function(){n(e).off("resize.dtr orientationchange.dtr draw.dtr")}),this.c.breakpoints.sort(function(e,t){return e.width<t.width?1:e.width>t.width?-1:0}),this._classLogic(),this._resizeAuto();var r=this.c.details;r.type&&(t._detailsInit(),this._detailsVis(),i.on("column-visibility.dtr",function(){t._detailsVis()}),i.on("draw.dtr",function(){i.rows({page:"current"}).iterator("row",function(e,n){var r=i.row(n);if(r.child.isShown()){var s=t.c.details.renderer(i,n);r.child(s,"child").show()}})}),n(i.table().node()).addClass("dtr-"+r.type)),this._resize()},_columnsVisiblity:function(e){var t,i,r=this.s.dt,s=this.s.columns,o=n.map(s,function(t){return t.auto&&null===t.minWidth?!1:t.auto===!0?"-":-1!==n.inArray(e,t.includeIn)}),a=0;for(t=0,i=o.length;i>t;t++)o[t]===!0&&(a+=s[t].minWidth);var l=r.settings()[0].oScroll,d=l.sY||l.sX?l.iBarWidth:0,c=r.table().container().offsetWidth-d,h=c-a;for(t=0,i=o.length;i>t;t++)s[t].control&&(h-=s[t].minWidth);var u=!1;for(t=0,i=o.length;i>t;t++)"-"!==o[t]||s[t].control||(u||h-s[t].minWidth<0?(u=!0,o[t]=!1):o[t]=!0,h-=s[t].minWidth);var f=!1;for(t=0,i=s.length;i>t;t++)if(!s[t].control&&!s[t].never&&!o[t]){f=!0;break}for(t=0,i=s.length;i>t;t++)s[t].control&&(o[t]=f);return-1===n.inArray(!0,o)&&(o[0]=!0),o},_classLogic:function(){var e=this,t=this.c.breakpoints,i=this.s.dt.columns().eq(0).map(function(e){var t=this.column(e).header().className;return{className:t,includeIn:[],auto:!1,control:!1,never:!!t.match(/\bnever\b/)}}),r=function(e,t){var r=i[e].includeIn;-1===n.inArray(t,r)&&r.push(t)},s=function(n,s,o,a){var l,d,c;if(o){if("max-"===o)for(l=e._find(s).width,d=0,c=t.length;c>d;d++)t[d].width<=l&&r(n,t[d].name);else if("min-"===o)for(l=e._find(s).width,d=0,c=t.length;c>d;d++)t[d].width>=l&&r(n,t[d].name);else if("not-"===o)for(d=0,c=t.length;c>d;d++)-1===t[d].name.indexOf(a)&&r(n,t[d].name)}else i[n].includeIn.push(s)};i.each(function(e,i){for(var r=e.className.split(" "),o=!1,a=0,l=r.length;l>a;a++){var d=n.trim(r[a]);if("all"===d)return o=!0,void(e.includeIn=n.map(t,function(e){return e.name}));if("none"===d||"never"===d)return void(o=!0);if("control"===d)return o=!0,void(e.control=!0);n.each(t,function(e,t){var n=t.name.split("-"),r=new RegExp("(min\\-|max\\-|not\\-)?("+n[0]+")(\\-[_a-zA-Z0-9])?"),a=d.match(r);a&&(o=!0,a[2]===n[0]&&a[3]==="-"+n[1]?s(i,t.name,a[1],a[2]+a[3]):a[2]!==n[0]||a[3]||s(i,t.name,a[1],a[2]))})}o||(e.auto=!0)}),this.s.columns=i},_detailsInit:function(){var e=this,t=this.s.dt,i=this.c.details;"inline"===i.type&&(i.target="td:first-child");var r=i.target,s="string"==typeof r?r:"td";n(t.table().body()).on("click",s,function(){if(n(t.table().node()).hasClass("collapsed")&&t.row(n(this).closest("tr")).length){if("number"==typeof r){var i=0>r?t.columns().eq(0).length+r:r;if(t.cell(this).index().column!==i)return}var s=t.row(n(this).closest("tr"));if(s.child.isShown())s.child(!1),n(s.node()).removeClass("parent");else{var o=e.c.details.renderer(t,s[0]);s.child(o,"child").show(),n(s.node()).addClass("parent")}}})},_detailsVis:function(){var e=this,t=this.s.dt,i=t.columns().indexes().filter(function(e){var i=t.column(e);return i.visible()?null:n(i.header()).hasClass("never")?null:e}),r=!0;(0===i.length||1===i.length&&this.s.columns[i[0]].control)&&(r=!1),r?t.rows({page:"current"}).eq(0).each(function(n){var i=t.row(n);if(i.child()){var r=e.c.details.renderer(t,i[0]);r===!1?i.child.hide():i.child(r,"child").show()}}):t.rows({page:"current"}).eq(0).each(function(e){t.row(e).child.hide()})},_find:function(e){for(var t=this.c.breakpoints,n=0,i=t.length;i>n;n++)if(t[n].name===e)return t[n]},_resize:function(){var t,i,r=this.s.dt,s=n(e).width(),o=this.c.breakpoints,a=o[0].name,l=this.s.columns;for(t=o.length-1;t>=0;t--)if(s<=o[t].width){a=o[t].name;break}var d=this._columnsVisiblity(a),c=!1;for(t=0,i=l.length;i>t;t++)if(d[t]===!1&&!l[t].never){c=!0;break}n(r.table().node()).toggleClass("collapsed",c),r.columns().eq(0).each(function(e,t){r.column(e).visible(d[t])})},_resizeAuto:function(){var e=this.s.dt,t=this.s.columns;if(this.c.auto&&-1!==n.inArray(!0,n.map(t,function(e){return e.auto}))){var i=(e.table().node().offsetWidth,e.columns,e.table().node().cloneNode(!1)),r=n(e.table().header().cloneNode(!1)).appendTo(i),s=n(e.table().body().cloneNode(!1)).appendTo(i);n(e.table().footer()).clone(!1).appendTo(i),e.rows({page:"current"}).indexes().flatten().each(function(t){var i=e.row(t).node().cloneNode(!0);e.columns(":hidden").flatten().length&&n(i).append(e.cells(t,":hidden").nodes().to$().clone()),n(i).appendTo(s)});var o=e.columns().header().to$().clone(!1);n("<tr/>").append(o).appendTo(r),"inline"===this.c.details.type&&n(i).addClass("dtr-inline collapsed");var a=n("<div/>").css({width:1,height:1,overflow:"hidden"}).append(i);a.find("th.never, td.never").remove(),a.insertBefore(e.table().node()),e.columns().eq(0).each(function(e){t[e].minWidth=o[e].offsetWidth||0}),a.remove()}}},r.breakpoints=[{name:"desktop",width:1/0},{name:"tablet-l",width:1024},{name:"tablet-p",width:768},{name:"mobile-l",width:480},{name:"mobile-p",width:320}],r.defaults={breakpoints:r.breakpoints,auto:!0,details:{renderer:function(e,t){var i=e.cells(t,":hidden").eq(0).map(function(t){var i=n(e.column(t.column).header()),r=e.cell(t).index();if(i.hasClass("control")||i.hasClass("never"))return"";var s=e.settings()[0],o=s.oApi._fnGetCellData(s,r.row,r.column,"display"),a=i.text();return a&&(a+=":"),'<li data-dtr-index="'+r.column+'"><span class="dtr-title">'+a+'</span> <span class="dtr-data">'+o+"</span></li>"}).toArray().join("");return i?n('<ul data-dtr-index="'+t+'"/>').append(i):!1},target:0,type:"inline"}};var s=n.fn.dataTable.Api;return s.register("responsive()",function(){return this}),s.register("responsive.index()",function(e){return e=n(e),{column:e.data("dtr-index"),row:e.parent().data("dtr-index")}}),s.register("responsive.rebuild()",function(){return this.iterator("table",function(e){e._responsive&&e._responsive._classLogic()})}),s.register("responsive.recalc()",function(){return this.iterator("table",function(e){e._responsive&&(e._responsive._resizeAuto(),e._responsive._resize())})}),r.version="1.0.6",n.fn.dataTable.Responsive=r,n.fn.DataTable.Responsive=r,n(t).on("init.dt.dtr",function(e,t){if("dt"===e.namespace&&(n(t.nTable).hasClass("responsive")||n(t.nTable).hasClass("dt-responsive")||t.oInit.responsive||i.defaults.responsive)){var s=t.oInit.responsive;s!==!1&&new r(t,n.isPlainObject(s)?s:{})}}),r};"function"==typeof define&&define.amd?define(["jquery","datatables"],n):"object"==typeof exports?n(require("jquery"),require("datatables")):jQuery&&!jQuery.fn.dataTable.Responsive&&n(jQuery,jQuery.fn.dataTable)}(window,document);