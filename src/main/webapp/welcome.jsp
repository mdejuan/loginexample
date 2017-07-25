<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>Create an account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#creditCard").hide();
		$("#searchCreditCard").hide();
		for (i = 2017; i < 2030; i++)
		{
		    $('#yearpicker').append($('<option />').val(i).html(i));
		}
		$("#newCreditCard").click(function() {
			$("#creditCard").show();
			$("#searchCreditCard").hide();
			$("#creditCard :input").attr("disabled", false);

		});
		
		$("#searchCard").click(function() {
			$("#creditCard").hide();
			$("#searchCreditCard").show();
			$("#searchCreditCard :input").attr("disabled", false);

		});
		
		$("#createAccount").click(function() {
			
			var number = $("#number").val();
			var expirationDate = $("#yearpicker").val().substring(2,4) +"/"+$("#mth").val();
			$.post('/saveCreditCard', {number: number, expirationDate : expirationDate},
			function(data) {

				
				$("#messages").text(data[0]);

			}).done(function() {
			}).fail(function(xhr, textStatus, errorThrown) {
			}).complete(function() {
				
			});

		});
		
		$("#searchAccount").click(function() {
			var number2 = $("#number2").val();
			$.post('/searchCreditCard', {number: number2},
					function(data) {

				$("#username").text(data.user.username);
				$("#numberAccount").text(data.number);
				$("#enddate").text(data.expirationDate);

					}).done(function() {
					}).fail(function(xhr, textStatus, errorThrown) {
					}).complete(function() {
						
					});

		});
	});
</script>
<body>
	<div class="container">


		<h2>
			Welcome ${pageContext.request.userPrincipal.name} | <a
				onclick="document.forms['logoutForm'].submit()">Logout</a>
		</h2>





		<button class="btn btn-lg btn-primary" id="newCreditCard">New
			Credit Card</button>
		<button class="btn btn-lg btn-primary" id="searchCard">Search
			Credit Card</button>



	</div>



	<div class="container" id="creditCard">


		<h2 class="form-heading">Create credit card</h2>

		<div>
			<span>${message}</span> Number: <input size="30" name="number"
				type="text" placeholder="Number" autofocus="true" id="number" />
			Expiration Date: Year: <select name="yearpicker" id="yearpicker"></select>
			Month: <select name="mth" id="mth" size="1">
				<option value="01">January</option>
				<option value="02">February</option>
				<option value="03">March</option>
				<option value="04">April</option>
				<option value="05">May</option>
				<option value="06">June</option>
				<option value="07">July</option>
				<option value="08">August</option>
				<option value="09">September</option>
				<option value="10">October</option>
				<option value="11">November</option>
				<option value="12">December</option>
			</select> <input size="30" name="expirationDate" type="hidden"
				autofocus="true" />

			<div id="messages"></div>
			<button class="btn btn-lg " id="createAccount">Create</button>

		</div>



	</div>

	<div class="container" id="searchCreditCard">


		<h2 class="form-heading">Search credit card</h2>

		<div>
			<span>${message}</span> Number: <input size="30" name="number2"
				type="text" placeholder="Number" autofocus="true" id="number2" />
			<div id="messages"></div>
			<button class="btn btn-lg " id="searchAccount">Search</button>
			<table>
				<thead>
					<tr>
						<td>User Name
						<td>
						<td>Account number
						<td>
						<td>End date
						<td>
					<tr>
				</thead>
				<tr>
					<td><span id="username"></span>
					<td>
					<td><span id="numberAccount"></span>
					<td>
					<td><span id="enddate"></span>
					<td>
				</tr>
			</table>
		</div>



	</div>




	<!-- /container -->

</body>
</html>
