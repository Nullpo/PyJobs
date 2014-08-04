<div class="container">
	<h2 class="text-center title-text">Detalles del Trabajo</h2>

	<div class="text-center">
	  <div>
		<p><strong>Titulo:</strong> ${job.position}</p>
	  </div>
	  <div>
		<p><strong>Empresa:</strong> <a href="javascript:loadPartialView('displayCompany?companyId=${job.company.id}');">${job.company.name}</a></p>
	  </div>
	  <div>
		<p><strong>Ubicación:</strong> ${job.location}</p>
	  </div>
	  <div>
		<p><strong>Descripción:</strong> ${job.description}</p>
	  </div>
	   <div>
		<p><strong>Para aplicar:</strong> ${job.meansOfApplication}</p>
	  </div>
	</div>

	<a class="btn btn-info back-button" href="/" type="button">Volver</a>
</div>