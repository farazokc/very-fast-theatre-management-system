<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Type</title>
</head>
<link href="css/bootstrap.css" rel="stylesheet" />
<body class="bg-dark">
<div class="text-center">
        <a href="AdminHome.jsp">
            <button type="button" class="btn btn-light" >Admin Home</button>
        </a>
    </div>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<br> <br> <br>
		<p class="h1 font-monospace text-white text-center">Edit Type</p>
	</div>
	<div class="container">
		<form class="form-horizontal" name="editType"
			action="editTypeController" method="get" display="none">
			<input type="hidden" name="formName" value="editType">

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Old Type ID:</label>
				<div class="col-sm-2">
					<input class="form-control" type="number" name="oldTID"
						placeholder="Enter Old Type ID" required min="0">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Type Name:</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="Type"
						placeholder="Enter Type Name" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Price:</label>
				<div class="col-sm-2">
					<input class="form-control" type="number" name="Price"
						placeholder="Enter Price" min=0>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-2">
					<input type="submit">
				</div>
			</div>
		</form>
	</div>
	<hr>
	<script type="text/javascript" href="js/jquery-3.6.1.js"></script>
	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>