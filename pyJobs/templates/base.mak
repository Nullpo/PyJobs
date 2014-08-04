<!DOCTYPE html>
<html lang="${request.locale_name}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Python Job Scaffold">
    <meta name="author" content="Job Scaffold">
    <link rel="shortcut icon" href="${request.static_url('pyJobs:static/images/logo.png')}">

    <title>PyJobs</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${request.static_url('pyJobs:static/css/bootstrap/bootstrap.min.css')}">

    <!-- Custom styles for this project -->
    <link href="${request.static_url('pyJobs:static/css/styles.css')}" rel="stylesheet">
	
	<script src="${request.static_url('pyJobs:static/js/jquery-2.1.1.min.js')}"></script>
	<script src="${request.static_url('pyJobs:static/js/bootstrap.min.js')}"></script>
	
	<script type="text/javascript">
		 $(function(){
				loadPartialView("listJobs?page=1");								
			});

		function loadPartialView(pageUrl)
		{
			
			var baseUrl = "${request.current_route_url()}";
			var url = baseUrl + pageUrl;
						
			// Call the ajax function in order to get the partial view.
			$.ajax({url: url, async: false})
					.done(function( data ) {
						
						$("#partial-view").empty();						
						$("#partial-view").append(data);
						
						})
					.fail(function( jqXHR, textStatus, errorThrown ) {
						console.log("Error" + errorThrown );
					});
		}
	</script>
	
  </head>

  <body>
  
	<!-- Navbar -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation">
	 <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#utnianos-navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="utnianos-navbar">
		  <ul class="nav navbar-nav">
			<li class="active"><a href="#">Inicio</a></li>
			<li><a href="#">Iniciar Sesion</a></li>
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<!-- Navbar -->
		
		<div id="partial-view"></div>
	
  </body>
</html>
