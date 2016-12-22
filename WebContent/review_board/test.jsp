<html><head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="-1">
		<title>jQuery Raty - A Star Rating Plugin</title>

		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="../lib/js/jquery.raty.js"></script>

	</head>
	<body>
		<div id="star" style="cursor: pointer; width: 200px;">
		<img src="../lib/images/star/star-on.png" alt="1" title="bad">&nbsp;
		<img src="../lib/images/star/star-on.png" alt="2" title="poor">&nbsp;
		<img src="../lib/images/star/star-on.png" alt="3" title="regular">&nbsp;
		<img src="../lib/images/star/star-off.png" alt="4" title="good">&nbsp;
		<img src="../lib/images/star/star-off.png" alt="5" title="gorgeous">
		<input type="hidden" name="score" value="3">
		</div>

		<div style="padding-top:20px;">
			<label for="starRating">Value : </label><input type="text" id="starRating" value="3">
		</div>

		<div style="padding-top:20px;">
			<label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span>
		</div>
	

	<script type="text/javascript">
		$(function() {
			$('div#star').raty({
				score: 3
				,path : "../lib/images/star"
				,width : 200
				,click: function(score, evt) {
					$("#starRating").val(score);
					$("#displayStarRating").html(score);
				}
			});
		});
	</script>
</body>
</html>