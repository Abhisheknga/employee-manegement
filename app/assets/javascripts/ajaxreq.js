$(document).ready(function() {
	partialSearch = function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		// console.log(code);
		if (!(code == 37 || code == 38 || code == 39 || code == 40)) {
			var searchString;
			searchString = document.getElementById("partialsearch").value;
			console.log(searchString);
			table_wrapper = $('#emp_table');	
	    	url = "/employee_search?search="+encodeURIComponent(searchString);
	    	console.log(url);
	    	table_wrapper.load(url);
		}
	};
	submitform = function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		// console.log(code);
		if (!(code == 37 || code == 38 || code == 39 || code == 40)) {
			document.getElementById("searchform").submit();
		}
	};
	var flag = true;
	ajaxSearchRequest = function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		// console.log(code);
		var searchString;
		searchString = document.getElementById("ajaxsearch").value;
		if (searchString.length > 0) {
			flag = true;
			$('#paginate').hide();
		}
		if (code == 37 || code == 38 || code == 39 || code == 40) {
			flag = false;
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
			if (searchString.length == 0) {
				flag = false;
				$('#paginate').show();
			}
		}
	};
	function reloadEmployee(data) {
		console.log(data);
		$('#emplist').html(data);
	}

});
