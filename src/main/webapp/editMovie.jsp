<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Movie</title>
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
	<div class="container">
		<br> <br> <br>
		<p class="h1 font-monospace text-white text-center">Edit Movie</p>
	</div>
	<div class="container">
		<form class="form-horizontal" name="editMovie"
			action="editMovieController" method="get" display="none">
			<input type="hidden" name="formName" value="editMovie">

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Old Movie ID:</label>
				<div class="col-sm-2">
					<input class="form-control" type="number"
						placeholder="Old Movie ID" name="oldMID" required min="0">
				</div>
			</div>

			

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Movie Name:</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="MovieName"
						placeholder="Enter Movie Name" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Movie Genre:</label>
				<div class="col-sm-2">
					<input class="form-control" class="form-control" type="text"
						name="Genre" placeholder="Enter Movie Genre" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Trailer Link:</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="Link"
						placeholder="Enter Movie Trailer Link" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Movie Duration:</label>
				<div class="col-sm-2">
					<input class="form-control" type="number" name="Duration"
						placeholder="Enter Movie Duration" step="any" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Movie Main Character:</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="MainChar"
						placeholder="Enter Movie Main Character" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2 text-white">Movie Description:</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="Description"
						placeholder="Enter Movie Description" required>
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