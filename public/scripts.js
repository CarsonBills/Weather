function clickForecastButton(){
	$(".forecast_button").on("click", function(e){
		fetchMenuItem();
	});
}

function fetchMenuItem(){
	var input_city = $("div.city").html().toLowerCase().replace(" ", "+")
	$.ajax({
		url : "/forecast",
		type : "post",
		data : {city: input_city},
		success: function(data){
			var header = "<p> Forecast for the next five days: </p>"
			$(".forecast").empty()
			$(".forecast").append(header, data);
		}
	});
}

