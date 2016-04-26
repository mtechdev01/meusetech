/* Flot plugin for showing crosshairs when the mouse hovers over the plot.

Copyright (c) 2007-2013 IOLA and Ole Laursen.
Licensed under the MIT license.

The plugin supports these options:

	crosshair: {
		mode: null or "x" or "y" or "xy"
		color: color
		lineWidth: number
	}

Set the mode to one of "x", "y" or "xy". The "x" mode enables a vertical
crosshair that lets you trace the values on the x axis, "y" enables a
horizontal crosshair and "xy" enables them both. "color" is the color of the
crosshair (default is "rgba(170, 0, 0, 0.80)"), "lineWidth" is the width of
the drawn lines (default is 1).

The plugin also adds four public methods:

  - setCrosshair( pos )

    Set the position of the crosshair. Note that this is cleared if the user
    moves the mouse. "pos" is in coordinates of the plot and should be on the
    form { x: xpos, y: ypos } (you can use x2/x3/... if you're using multiple
    axes), which is coincidentally the same format as what you get from a
    "plothover" event. If "pos" is null, the crosshair is cleared.

  - clearCrosshair()

    Clear the crosshair.

  - lockCrosshair(pos)

    Cause the crosshair to lock to the current location, no longer updating if
    the user moves the mouse. Optionally supply a position (passed on to
    setCrosshair()) to move it to.

    Example usage:

	var myFlot = $.plot( $("#graph"), ..., { crosshair: { mode: "x" } } };
	$("#graph").bind( "plothover", function ( evt, position, item ) {
		if ( item ) {
			// Lock the crosshair to the data point being hovered
			myFlot.lockCrosshair({
				x: item.datapoint[ 0 ],
				y: item.datapoint[ 1 ]
			});
		} else {
			// Return normal crosshair operation
			myFlot.unlockCrosshair();
		}
	});

  - unlockCrosshair()

    Free the crosshair to move again after locking it.
*/
!function(o){function e(o){function e(){i.locked||-1!=i.x&&(i.x=-1,o.triggerRedrawOverlay())}function t(e){if(!i.locked){if(o.getSelection&&o.getSelection())return void(i.x=-1);var t=o.offset();i.x=Math.max(0,Math.min(e.pageX-t.left,o.width())),i.y=Math.max(0,Math.min(e.pageY-t.top,o.height())),o.triggerRedrawOverlay()}}var i={x:-1,y:-1,locked:!1};o.setCrosshair=function(e){if(e){var t=o.p2c(e);i.x=Math.max(0,Math.min(t.left,o.width())),i.y=Math.max(0,Math.min(t.top,o.height()))}else i.x=-1;o.triggerRedrawOverlay()},o.clearCrosshair=o.setCrosshair,o.lockCrosshair=function(e){e&&o.setCrosshair(e),i.locked=!0},o.unlockCrosshair=function(){i.locked=!1},o.hooks.bindEvents.push(function(o,i){o.getOptions().crosshair.mode&&(i.mouseout(e),i.mousemove(t))}),o.hooks.drawOverlay.push(function(o,e){var t=o.getOptions().crosshair;if(t.mode){var r=o.getPlotOffset();if(e.save(),e.translate(r.left,r.top),-1!=i.x){var n=o.getOptions().crosshair.lineWidth%2===0?0:.5;if(e.strokeStyle=t.color,e.lineWidth=t.lineWidth,e.lineJoin="round",e.beginPath(),-1!=t.mode.indexOf("x")){var s=Math.round(i.x)+n;e.moveTo(s,0),e.lineTo(s,o.height())}if(-1!=t.mode.indexOf("y")){var a=Math.round(i.y)+n;e.moveTo(0,a),e.lineTo(o.width(),a)}e.stroke()}e.restore()}}),o.hooks.shutdown.push(function(o,i){i.unbind("mouseout",e),i.unbind("mousemove",t)})}var t={crosshair:{mode:null,color:"rgba(170, 0, 0, 0.80)",lineWidth:1}};o.plot.plugins.push({init:e,options:t,name:"crosshair",version:"1.0"})}(jQuery);