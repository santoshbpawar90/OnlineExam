 if (window.document.addEventListener) {
                	window.document.addEventListener("keydown", avoidInvalidKeyStorkes, false);
                	} else {
                	window.document.attachEvent("onkeydown", avoidInvalidKeyStorkes);
                	document.captureEvents(Event.KEYDOWN);
                	}

                	function avoidInvalidKeyStorkes(evtArg) {

                	var evt = (document.all ? window.event : evtArg);
                	var isIE = (document.all ? true : false);
                	var KEYCODE = (document.all ? window.event.keyCode : evtArg.which);

                	var element = (document.all ? window.event.srcElement : evtArg.target);
                	//var msg = "We have disabled this key: " + KEYCODE;

                	switch (KEYCODE) {
                	case 112: //F1
                	case 113: //F2
                	case 114: //F3
                	case 115: //F4
                	case 116: //F5
                	case 117: //F6
                	case 118: //F7
                	case 119: //F8
                	case 120: //F9
                	case 121: //F10
                	case 122: //F11
                	case 123: //F12
                	case 27: //ESCAPE
                	
                	if (isIE) {
                	if (KEYCODE == "112") {

                	document.onhelp = function() { return (false); }
                	window.onhelp = function() { return (false); }
                	}
                	
                	if (isIE) {
                    	if (KEYCODE == "27") {

                    	document.onhelp = function() { return (false); }
                    	window.onhelp = function() { return (false); }
                    	}
                	}
                    	

                	evt.returnValue = false;
                	evt.keyCode = 0;
                	window.status = msg;
                	} else {
                	evt.preventDefault();
                	evt.stopPropagation();
                	//alert(msg);
                	}
                	break;
                	default:
                	window.status = "Done";
                	}
                	}
                