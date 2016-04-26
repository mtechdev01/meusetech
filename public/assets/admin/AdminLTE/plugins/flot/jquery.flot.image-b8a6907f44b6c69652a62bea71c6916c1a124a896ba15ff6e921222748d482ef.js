/* Flot plugin for plotting images.

Copyright (c) 2007-2013 IOLA and Ole Laursen.
Licensed under the MIT license.

The data syntax is [ [ image, x1, y1, x2, y2 ], ... ] where (x1, y1) and
(x2, y2) are where you intend the two opposite corners of the image to end up
in the plot. Image must be a fully loaded Javascript image (you can make one
with new Image()). If the image is not complete, it's skipped when plotting.

There are two helpers included for retrieving images. The easiest work the way
that you put in URLs instead of images in the data, like this:

	[ "myimage.png", 0, 0, 10, 10 ]

Then call $.plot.image.loadData( data, options, callback ) where data and
options are the same as you pass in to $.plot. This loads the images, replaces
the URLs in the data with the corresponding images and calls "callback" when
all images are loaded (or failed loading). In the callback, you can then call
$.plot with the data set. See the included example.

A more low-level helper, $.plot.image.load(urls, callback) is also included.
Given a list of URLs, it calls callback with an object mapping from URL to
Image object when all images are loaded or have failed loading.

The plugin supports these options:

	series: {
		images: {
			show: boolean
			anchor: "corner" or "center"
			alpha: [ 0, 1 ]
		}
	}

They can be specified for a specific series:

	$.plot( $("#placeholder"), [{
		data: [ ... ],
		images: { ... }
	])

Note that because the data format is different from usual data points, you
can't use images with anything else in a specific data series.

Setting "anchor" to "center" causes the pixels in the image to be anchored at
the corner pixel centers inside of at the pixel corners, effectively letting
half a pixel stick out to each side in the plot.

A possible future direction could be support for tiling for large images (like
Google Maps).

*/
!function(a){function i(a,i,e){var n=a.getPlotOffset();if(e.images&&e.images.show)for(var o=e.datapoints.points,t=e.datapoints.pointsize,r=0;r<o.length;r+=t){var s,m=o[r],h=o[r+1],p=o[r+2],u=o[r+3],g=o[r+4],c=e.xaxis,l=e.yaxis;if(!(!m||m.width<=0||m.height<=0||(h>u&&(s=u,u=h,h=s),p>g&&(s=g,g=p,p=s),"center"==e.images.anchor&&(s=.5*(u-h)/(m.width-1),h-=s,u+=s,s=.5*(g-p)/(m.height-1),p-=s,g+=s),h==u||p==g||h>=c.max||u<=c.min||p>=l.max||g<=l.min))){var f=0,d=0,x=m.width,w=m.height;h<c.min&&(f+=(x-f)*(c.min-h)/(u-h),h=c.min),u>c.max&&(x+=(x-f)*(c.max-u)/(u-h),u=c.max),p<l.min&&(w+=(d-w)*(l.min-p)/(g-p),p=l.min),g>l.max&&(d+=(d-w)*(l.max-g)/(g-p),g=l.max),h=c.p2c(h),u=c.p2c(u),p=l.p2c(p),g=l.p2c(g),h>u&&(s=u,u=h,h=s),p>g&&(s=g,g=p,p=s),s=i.globalAlpha,i.globalAlpha*=e.images.alpha,i.drawImage(m,f,d,x-f,w-d,h+n.left,p+n.top,u-h,g-p),i.globalAlpha=s}}}function e(a,i,e,n){i.images.show&&(n.format=[{required:!0},{x:!0,number:!0,required:!0},{y:!0,number:!0,required:!0},{x:!0,number:!0,required:!0},{y:!0,number:!0,required:!0}])}function n(a){a.hooks.processRawData.push(e),a.hooks.drawSeries.push(i)}var o={series:{images:{show:!1,alpha:1,anchor:"corner"}}};a.plot.image={},a.plot.image.loadDataImages=function(i,e,n){var o=[],t=[],r=e.series.images.show;a.each(i,function(i,e){(r||e.images.show)&&(e.data&&(e=e.data),a.each(e,function(a,i){"string"==typeof i[0]&&(o.push(i[0]),t.push(i))}))}),a.plot.image.load(o,function(i){a.each(t,function(a,e){var n=e[0];i[n]&&(e[0]=i[n])}),n()})},a.plot.image.load=function(i,e){var n=i.length,o={};0==n&&e({}),a.each(i,function(i,t){var r=function(){--n,o[t]=this,0==n&&e(o)};a("<img />").load(r).error(r).attr("src",t)})},a.plot.plugins.push({init:n,options:o,name:"image",version:"1.1"})}(jQuery);