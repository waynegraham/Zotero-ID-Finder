$(document).ready(function(){
	$('#search').click(function() {
		url = "/" + $('#username').val();
	
		
		$.get(url, function(data){
		//	alert(data);
		})
	 
	});
});