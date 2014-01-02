$(document).ready(function() {
	submitform = function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		console.log(code);
		if (!(code==37||code==38||code==39||code==40)) {
			document.getElementById("searchform").submit();
		}
	};
	var flag = true;
	ajaxSearchRequest = function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		// console.log(code);
		var searchString;
		searchString = document.getElementById("ajaxsearch").value;
		if (searchString.length>0)
				flag=true;
		if (code==37||code==38||code==39||code==40) {
			flag=false;
		}
		if (flag == true) {
			$.ajax({
				type : "GET",
				url : "/employeelist",
				// dataType : "jsonp",
				dataType : "html",
				data : {
					search : searchString
				},
				success : reloadEmployee,
				error : function(data) {
					console.log(data);
				}
			});
			if (searchString.length==0)
				flag=false;
		}

	};
	function reloadEmployee(data) {
		console.log(data);
		$('#emplist').html(data);
	}
});
