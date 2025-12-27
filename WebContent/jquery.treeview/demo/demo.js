$(document).ready(function(){
	
$("#browser").treeview({
 animated:"normal",
 persist: "cookie",
 cookieId: "rememberme"
});

$("#samplebutton").click(function(){
 var branches = $("<li><span class='folder'>New Sublist</span><ul>" + 
"<li><span class='file'>Item1</span></li>" +
"<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
 $("#browser").treeview({
  add: branches
 });
});


});