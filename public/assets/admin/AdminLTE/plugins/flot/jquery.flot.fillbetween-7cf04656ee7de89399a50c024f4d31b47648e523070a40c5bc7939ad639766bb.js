/* Flot plugin for computing bottoms for filled line and bar charts.

Copyright (c) 2007-2013 IOLA and Ole Laursen.
Licensed under the MIT license.

The case: you've got two series that you want to fill the area between. In Flot
terms, you need to use one as the fill bottom of the other. You can specify the
bottom of each data point as the third coordinate manually, or you can use this
plugin to compute it for you.

In order to name the other series, you need to give it an id, like this:

	var dataset = [
		{ data: [ ... ], id: "foo" } ,         // use default bottom
		{ data: [ ... ], fillBetween: "foo" }, // use first dataset as bottom
	];

	$.plot($("#placeholder"), dataset, { lines: { show: true, fill: true }});

As a convenience, if the id given is a number that doesn't appear as an id in
the series, it is interpreted as the index in the array instead (so fillBetween:
0 can also mean the first series).

Internally, the plugin modifies the datapoints in each series. For line series,
extra data points might be inserted through interpolation. Note that at points
where the bottom line is not defined (due to a null point or start/end of line),
the current line will show a gap too. The algorithm comes from the
jquery.flot.stack.js plugin, possibly some code could be shared.

*/
!function(e){function n(e){function n(e,n){var l;for(l=0;l<n.length;++l)if(n[l].id===e.fillBetween)return n[l];return"number"==typeof e.fillBetween?e.fillBetween<0||e.fillBetween>=n.length?null:n[e.fillBetween]:null}function l(e,l,i){if(null!=l.fillBetween){var t=n(l,e.getData());if(t){for(var f,s,o,u,p,r,h,a,g=i.pointsize,w=i.points,B=t.datapoints.pointsize,c=t.datapoints.points,v=[],b=l.lines.show,d=g>2&&i.format[2].y,m=b&&l.lines.steps,y=!0,k=0,z=0;;){if(k>=w.length)break;if(h=v.length,null==w[k]){for(a=0;g>a;++a)v.push(w[k+a]);k+=g}else if(z>=c.length){if(!b)for(a=0;g>a;++a)v.push(w[k+a]);k+=g}else if(null==c[z]){for(a=0;g>a;++a)v.push(null);y=!0,z+=B}else{if(f=w[k],s=w[k+1],u=c[z],p=c[z+1],r=0,f===u){for(a=0;g>a;++a)v.push(w[k+a]);r=p,k+=g,z+=B}else if(f>u){if(b&&k>0&&null!=w[k-g]){for(o=s+(w[k-g+1]-s)*(u-f)/(w[k-g]-f),v.push(u),v.push(o),a=2;g>a;++a)v.push(w[k+a]);r=p}z+=B}else{if(y&&b){k+=g;continue}for(a=0;g>a;++a)v.push(w[k+a]);b&&z>0&&null!=c[z-B]&&(r=p+(c[z-B+1]-p)*(f-u)/(c[z-B]-u)),k+=g}y=!1,h!==v.length&&d&&(v[h+2]=r)}if(m&&h!==v.length&&h>0&&null!==v[h]&&v[h]!==v[h-g]&&v[h+1]!==v[h-g+1]){for(a=0;g>a;++a)v[h+g+a]=v[h+a];v[h+1]=v[h-g+1]}}i.points=v}}}e.hooks.processDatapoints.push(l)}var l={series:{fillBetween:null}};e.plot.plugins.push({init:n,options:l,name:"fillbetween",version:"1.0"})}(jQuery);