<div class="container">

	<h2 class="text-center title-text">${company.name}</h2>
	
	%if company.logoUrl is not None:
	<div class="text-center">
       <img alt="Company Logo" width="120px" height="120px" src="${request.static_url('pyJobs:static/store/logos/')}${company.logoUrl}" />
	</div>
	%endif

	<div class="text-center">
	  <div>
		<p><strong>E-mail: </strong>${company.email}</p>
	  </div>
	  <div>
		<p><strong>Ubicación: </strong> ${company.location}</p>
	  </div>
	   <div>
		<p><strong>Dirección: </strong> ${company.address}</p>
	  </div>
	</div>

	<a class="btn btn-info back-button" href="/" type="button">Volver</a>
</div>