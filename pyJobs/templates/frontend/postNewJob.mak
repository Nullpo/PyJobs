<div class="container">
	
	<script>
		    function submitForm() 
			{
				if(!$(".error-message").hasClass("invisible"))
				{
					$(".error-message").addClass("invisible");
				}
								
				$.post("/postNewJob", $("form").serialize())
				 .done(function( data ) {
							loadPartialView("listJobs?page=1");
					})
				 .fail(function(){
						$(".error-message").removeClass("invisible");
				 });
			}			 
	</script>

	<h2 class="text-center title-text">Nuevo aviso</h2>
	
	  <div class="job-form">
		<form role="form-inline" action="/loadJobForm" method="GET">
		  % for field in form:
		  <div class="form-group">
			<label for="field">${field.label} :</label>
			${field(class_="form-control",placeholder="Field Placeholder")}
		  </div>
		  % endfor
		</form>
	  </div>
	  
	  <div class="action-buttons">
		  <a class="btn btn-default back-button" href="javascript:submitForm();">Envíar</a>
		  <a class="btn btn-info back-button btn-volver" href="/" type="button">Volver</a>
	  </div>
	  
	  <div class="align-center">
		  <div class="text-center error-message invisible">
			  <div class="alert alert-warning alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			  <strong>Error:&nbsp;</strong>Por favor, complete los campos requeridos y vuelva a intentarlo.
			  </div>
		  </div>
	  </div>
	  
</div>