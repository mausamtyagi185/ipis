window.onload = function() {
	/*<div class="test"></div>*/
	
/*	var body = document.body,
	html = document.documentElement;

    var height = Math.max( body.scrollHeight, body.offsetHeight, 
                       html.clientHeight, html.scrollHeight, html.offsetHeight );*/
	var location=window.location.href;
	//alert(location);
	
$.getJSON("setLocationUrl?url="+location,function(data){
   });
}