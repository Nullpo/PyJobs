	<div class="container">
		
		<script type="text/javascript">
		function filterJobs()
		{
			var keyword = $("#job-offer-input").val();
			
			if(keyword != "")
			{
				loadPartialView("listJobs?page=1&filter=" + keyword);			
			}
		}
		
		$("#job-offer-input").keydown(function(event) { 
				
			if(event.which == 13)
			{
				filterJobs();
			}	
			
		});
		</script>
		
		<h2 class="text-center title-text">Ofertas de Trabajo</h2>
	
		<a type="button" class="btn btn-primary" id="post-job-offer" href="javascript:loadPartialView('postNewJob');">Postear una oferta de trabajo</a>
					
		<div class="search-form">
			<input type="text" id="job-offer-input" class="form-control"  placeholder="Ingrese una palabra clave" />
			<a class="btn btn-primary hidden-xs" id="search-button" href="javascript:filterJobs();">Buscar</a>
		</div>	
				
		<div class="table-responsive">
			<table class="table table-stripped">
				<tr>
				  <th>Puesto</th>
				  <th>Categoría</th>
				  <th></th>
				</tr>
													
				% for job in jobs:
				<tr>
						<td>${job.position}</td>
						<td><a href="javascript:loadPartialView('listJobs?page=1&categoryId=${job.category.id}');">${job.category.name}</a></td>
						<td><a href="javascript:loadPartialView('displayJob?jobId=${job.id}');">Detalle</a></td>
				</tr>
				%endfor
			</table>
		</div>
		
		<!-- Pagination is hidden in small devices, since it does not look good. -->
		%if pagesCount not in [0,1]:
			<ul class="pagination hidden-xs">
			  %if currentPage == 1:
				<li class="disabled"><a href="#">&laquo;</a></li>
			  %else:
				<li><a href="javascript:loadPartialView('listJobs?page=${currentPage-1}')">&laquo;</a></li>
			  %endif
			  % for i in range(pagesCount):
				   %if i+1 == currentPage:
						<li><a class="disabled" href="javascript:void();">${i+1}</a></li>
				   %else:
						<li><a href="javascript:loadPartialView('listJobs?page=${i+1}')">${i+1}</a></li>
				   %endif
			  % endfor
			  %if currentPage == pagesCount:
				<li class="disabled" ><a href="javascript:void();">&raquo;</a></li>
			  %else:
				<li><a href="javascript:loadPartialView('listJobs?page=${currentPage+1}')">&raquo;</a></li>
			  %endif
			</ul>	
		%endif
		
	</div>