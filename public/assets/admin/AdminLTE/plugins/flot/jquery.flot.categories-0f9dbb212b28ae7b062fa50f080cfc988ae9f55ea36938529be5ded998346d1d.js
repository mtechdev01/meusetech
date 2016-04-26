/* Flot plugin for plotting textual data or categories.

Copyright (c) 2007-2013 IOLA and Ole Laursen.
Licensed under the MIT license.

Consider a dataset like [["February", 34], ["March", 20], ...]. This plugin
allows you to plot such a dataset directly.

To enable it, you must specify mode: "categories" on the axis with the textual
labels, e.g.

	$.plot("#placeholder", data, { xaxis: { mode: "categories" } });

By default, the labels are ordered as they are met in the data series. If you
need a different ordering, you can specify "categories" on the axis options
and list the categories there:

	xaxis: {
		mode: "categories",
		categories: ["February", "March", "April"]
	}

If you need to customize the distances between the categories, you can specify
"categories" as an object mapping labels to values

	xaxis: {
		mode: "categories",
		categories: { "February": 1, "March": 3, "April": 4 }
	}

If you don't specify all categories, the remaining categories will be numbered
from the max value plus 1 (with a spacing of 1 between each).

Internally, the plugin works by transforming the input data through an auto-
generated mapping where the first category becomes 0, the second 1, etc.
Hence, a point like ["February", 34] becomes [0, 34] internally in Flot (this
is visible in hover and click events that return numbers rather than the
category labels). The plugin also overrides the tick generator to spit out the
categories as ticks instead of the values.

If you need to map a value back to its label, the mapping is always accessible
as "categories" on the axis object, e.g. plot.getAxes().xaxis.categories.

*/
!function(r){function o(r,o,e,i){var s="categories"==o.xaxis.options.mode,n="categories"==o.yaxis.options.mode;if(s||n){var a=i.format;if(!a){var t=o;if(a=[],a.push({x:!0,number:!0,required:!0}),a.push({y:!0,number:!0,required:!0}),t.bars.show||t.lines.show&&t.lines.fill){var u=!!(t.bars.show&&t.bars.zero||t.lines.show&&t.lines.zero);a.push({y:!0,number:!0,required:!1,defaultValue:0,autoscale:u}),t.bars.horizontal&&(delete a[a.length-1].y,a[a.length-1].x=!0)}i.format=a}for(var f=0;f<a.length;++f)a[f].x&&s&&(a[f].number=!1),a[f].y&&n&&(a[f].number=!1)}}function e(r){var o=-1;for(var e in r)r[e]>o&&(o=r[e]);return o+1}function i(r){var o=[];for(var e in r.categories){var i=r.categories[e];i>=r.min&&i<=r.max&&o.push([i,e])}return o.sort(function(r,o){return r[0]-o[0]}),o}function s(o,e,s){if("categories"==o[e].options.mode){if(!o[e].categories){var a={},t=o[e].options.categories||{};if(r.isArray(t))for(var u=0;u<t.length;++u)a[t[u]]=u;else for(var f in t)a[f]=t[f];o[e].categories=a}o[e].options.ticks||(o[e].options.ticks=i),n(s,e,o[e].categories)}}function n(r,o,i){for(var s=r.points,n=r.pointsize,a=r.format,t=o.charAt(0),u=e(i),f=0;f<s.length;f+=n)if(null!=s[f])for(var c=0;n>c;++c){var l=s[f+c];null!=l&&a[c][t]&&(l in i||(i[l]=u,++u),s[f+c]=i[l])}}function a(r,o,e){s(o,"xaxis",e),s(o,"yaxis",e)}function t(r){r.hooks.processRawData.push(o),r.hooks.processDatapoints.push(a)}var u={xaxis:{categories:null},yaxis:{categories:null}};r.plot.plugins.push({init:t,options:u,name:"categories",version:"1.0"})}(jQuery);