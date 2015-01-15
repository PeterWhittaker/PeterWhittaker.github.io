---

layout: default
title: javascript width test

---


### JQuery version
Viewport width (window.width): <span id="width"></span>

Document width, CSS (html.css("width")): <span id="widthcss"></span>

Viewport width, em (window width divided by font-size): <span id="wem"></span>

Viewport height (window.height): <span id="height"></span>

Document height, CSS (html.css("height")): <span id="heightcss"></span>

Viewport height, em (window height divided by font-size): <span id="hem"></span>

Current font-size (html.css("font-size")) : <span id="fontsize"></span>

### Plain-jane JS version
Viewport size: <span id="w"></span><span id="h"></span>

(Plain-jane calculated by finding document element by id, then finding clientWidth, clientHeight.)

{% comment %}
<script src="http://code.jquery.com/jquery-1.11.2.js"></script>
{% endcomment %}

<script src="http://code.jquery.com/jquery-latest.js"> </script>

<script>

    $(document).ready(function(e) {
	showViewportSize();    
    });

    $(window).resize(function(e) {
	showViewportSize();
    });

    function showViewportSize() {
	var the_width = $(window).width();
	var the_height = $(window).height();                   
	var the_widthcss = $("html").css("width");
	var the_heightcss = $("html").css("height");
	var the_fontsize = $("html").css("font-size").replace(/\D/g,'');
	var the_wem = the_width / the_fontsize;
	var the_hem = the_height / the_fontsize;
	$('#width').text(the_width);
	$('#height').text(the_height);
	$('#widthcss').text(the_widthcss);
	$('#heightcss').text(the_heightcss);
	$('#fontsize').text(the_fontsize);
	$('#wem').text(the_wem);
	$('#hem').text(the_hem);
    }

    (function() {
	if (typeof(document.documentElement.clientWidth) != 'undefined') {
	    var $w = document.getElementById('w'),
		$h = document.getElementById('h');
	    $w.innerHTML = document.documentElement.clientWidth;
	    $h.innerHTML = ' &times; ' + document.documentElement.clientHeight;
	    window.onresize = function(event) {
		$w.innerHTML = document.documentElement.clientWidth;
		$h.innerHTML = ' &times; ' + document.documentElement.clientHeight;
	    };
	}
    })();

</script>

