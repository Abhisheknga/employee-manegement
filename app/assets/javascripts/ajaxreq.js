$(document).ready(function() {
	partialSearch = function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		// console.log(code);
		if (!(code == 37 || code == 38 || code == 39 || code == 40)) {
			var searchString;
			searchString = document.getElementById("partialsearch").value;
			console.log(searchString);
			table_wrapper = $('#emp_table');
			url = "/employee_search?search=" + encodeURIComponent(searchString);
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

	var flag = true;
	refreshData = function(event) {
		var col2, col3, col4, col5, col6, col7, col8, row1, sorttype;
		if (flag == true) {
			flag = false;
			sorttype = "ASC";
		} else {
			flag = true;
			sorttype = "DESC";
		}
		$.ajax({
			type : "GET",
			url : "/prioritysort",
			dataType : "json",
			data : {
				sort_as : sorttype
			},
			success : function(data) {
				var col1, record, sorted_table, _i, _len;
				console.log(data);
				sorted_table = $("#sortedTable");
				sorted_table.empty();
				for ( _i = 0, _len = data.length; _i < _len; _i++) {
					record = data[_i];
					console.log(record);
					col1 = $("<td>" + record.id + "</tb>");
					col2 = $("<td>" + record.title + "</tb>");
					col3 = $("<td>" + record.due_date + "</tb>");
					col4 = $("<td>" + record.priority + "</tb>");
					col5 = $("<td>" + record.description + "</tb>");
					col6 = $("<td><a href='records/" + record.id + "'>Show</a></td>");
					col7 = $("<td><a href='/records/" + record.id + "/edit'>Edit</a></td>");
					col8 = $("<td><a data-confirm='Are yoy sure?' data-method='delete' href='/records/" + record.id + "' rel='nofollow'>Delete</a></td>");
					row1 = $("<tr></tr>");
					row1.append(col1, col2, col3, col4, col5, col6, col7, col8);
					sorted_table.append(row1);
				}
			},
			error : function(data) {
				console.log(data);
			}
		});
	};
});
