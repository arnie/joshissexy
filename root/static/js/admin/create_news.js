YAHOO.util.Event.onDOMReady(function() {
	var myEditor = new YAHOO.widget.Editor('message', {
		dompath: true, //Turns on the bar at the bottom
		//animate: true //Animates the opening, closing and moving of Editor windows
	});
	myEditor.render();
});
