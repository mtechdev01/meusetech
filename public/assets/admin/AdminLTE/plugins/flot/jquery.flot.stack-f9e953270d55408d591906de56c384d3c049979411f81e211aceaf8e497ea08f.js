/* Flot plugin for stacking data sets rather than overlyaing them.

Copyright (c) 2007-2013 IOLA and Ole Laursen.
Licensed under the MIT license.

The plugin assumes the data is sorted on x (or y if stacking horizontally).
For line charts, it is assumed that if a line has an undefined gap (from a
null point), then the line above it should have the same gap - insert zeros
instead of "null" if you want another behaviour. This also holds for the start
and end of the chart. Note that stacking a mix of positive and negative values
in most instances doesn't make sense (so it looks weird).

Two or more series are stacked when their "stack" attribute is set to the same
key (which can be any number or string or just "true"). To specify the default
stack, you can set the stack option like this:

	series: {
		stack: null/false, true, or a key (number/string)
	}

You can also specify it for a single series, like this:

	$.plot( $("#placeholder"), [{
		data: [ ... ],
		stack: true
	}])

The stacking order is determined by the order of the data series in the array
(later series end up on top of the previous).

Internally, the plugin modifies the datapoints in each series, adding an
offset to the y value. For line series, extra data points are inserted through
interpolation. If there's a second y value, it's also adjusted (e.g for bar
charts or filled areas).

*/
!function(s){function n(s){function n(s,n){for(var t=null,i=0;i<n.length&&s!=n[i];++i)n[i].stack==s.stack&&(t=n[i]);return t}function t(s,t,i){if(null!=t.stack&&t.stack!==!1){var l=n(t,s.getData());if(l){for(var o,e,f,u,a,r,p,h,c=i.pointsize,g=i.points,k=l.datapoints.pointsize,v=l.datapoints.points,m=[],z=t.lines.show,b=t.bars.horizontal,d=c>2&&(b?i.format[2].x:i.format[2].y),y=z&&t.lines.steps,D=!0,j=b?1:0,w=b?0:1,x=0,Q=0;;){if(x>=g.length)break;if(p=m.length,null==g[x]){for(h=0;c>h;++h)m.push(g[x+h]);x+=c}else if(Q>=v.length){if(!z)for(h=0;c>h;++h)m.push(g[x+h]);x+=c}else if(null==v[Q]){for(h=0;c>h;++h)m.push(null);D=!0,Q+=k}else{if(o=g[x+j],e=g[x+w],u=v[Q+j],a=v[Q+w],r=0,o==u){for(h=0;c>h;++h)m.push(g[x+h]);m[p+w]+=a,r=a,x+=c,Q+=k}else if(o>u){if(z&&x>0&&null!=g[x-c]){for(f=e+(g[x-c+w]-e)*(u-o)/(g[x-c+j]-o),m.push(u),m.push(f+a),h=2;c>h;++h)m.push(g[x+h]);r=a}Q+=k}else{if(D&&z){x+=c;continue}for(h=0;c>h;++h)m.push(g[x+h]);z&&Q>0&&null!=v[Q-k]&&(r=a+(v[Q-k+w]-a)*(o-u)/(v[Q-k+j]-u)),m[p+w]+=r,x+=c}D=!1,p!=m.length&&d&&(m[p+2]+=r)}if(y&&p!=m.length&&p>0&&null!=m[p]&&m[p]!=m[p-c]&&m[p+1]!=m[p-c+1]){for(h=0;c>h;++h)m[p+c+h]=m[p+h];m[p+1]=m[p-c+1]}}i.points=m}}}s.hooks.processDatapoints.push(t)}var t={series:{stack:null}};s.plot.plugins.push({init:n,options:t,name:"stack",version:"1.2"})}(jQuery);