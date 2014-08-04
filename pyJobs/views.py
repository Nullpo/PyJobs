import sys
from math import ceil

from pyramid.response import Response
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound

from sqlalchemy.exc import DBAPIError

from .models import (
    DBSession,
    JobOffers,
    Companies,
    JobCategories
    )

from .jobForms import JobOfferForm

# Home
@view_config(route_name='home', renderer='templates/base.mak')
def home(request):
    return {'project': 'pyJobs'}

@view_config(route_name='postNewJob', renderer='templates/frontend/postNewJob.mak')
def loadJob(request):
   
    form = JobOfferForm(request.POST)
    print(request.POST)
    if request.POST:
       
       if form.validate():
       
          jobOffer = JobOffers()
          company = Companies()
          category = JobCategories()
          
          # Fill in the object manually because fuck you that's why. 
                  
          company.name = form.company.data
          company.logoUrl = None
          company.email = None
          company.location = None
          company.address = None
          company.jobsLimit = None
          
          DBSession.add(company)
                               
          category = DBSession.query(JobCategories).filter(JobCategories.id == 5).one()
          
          jobOffer.position = form.position.data
          jobOffer.location = form.location.data
          jobOffer.description = form.description.data
          jobOffer.meansOfApplication = form.meansOfApplication.data
          jobOffer.company = company
          jobOffer.category = category
          
          # Store the object.
          DBSession.add(jobOffer)
                  
          return Response(content_type='text/plain', status_int=200)
       else:
          return Response(content_type='text/plain', status_int=500)
    
    return {'form': form}
   
@view_config(route_name='listJobs', renderer='templates/frontend/listJobs.mak')
def listJobs(request):

   # TODO - Parametrize me! 
   resultsPerPage = 5
   
   page = int(request.params.get('page'))
   
   start = (resultsPerPage * (page-1)) + (page -1)
   stop =  (resultsPerPage * page) + (page - 1)
   
   try:
        
        jobs = DBSession.query(JobOffers)
        filter = request.params.get('filter')
        categoryId = request.params.get('categoryId')
        
        """
        TODO - .match() should be used instead of == for comparing,since the user might not allways want an exact match
        ,but apparently the match operator doesn't work well in SQLIte. 
        We should go back to this issue after migrating to postgres. 
        """        
        if(filter is not None) and (filter is not ""):
          jobs = jobs.filter(JobOffers.position == filter)
        
        if(categoryId is not None):
          jobs = jobs.filter(JobOffers.category_id == int(categoryId))
        
        jobsCount = jobs.count()
        
        if(start is not 0):
           start = start-1
        
        jobs = jobs.slice(start, stop)
                
        pagesCount = ceil(jobsCount / resultsPerPage)
                    
   except Exception as inst:
     err_msg = type(inst) + inst.args + inst
     return Response(err_msg, content_type='text/plain', status_int=500)
    
   return {'jobs': jobs,'jobsCount': jobsCount, 'pagesCount': pagesCount, 'currentPage': page}

@view_config(route_name='displayJob', renderer='templates/frontend/displayJob.mak')
def displayJob(request):

    jobId = int(request.params.get('jobId'))
    
    try:
        job = DBSession.query(JobOffers).filter(JobOffers.id == jobId).one()
    except Exception as inst:
     err_msg = type(inst) + inst.args + inst
     return Response(err_msg, content_type='text/plain', status_int=500)

    return {'job': job}

@view_config(route_name='displayCompany', renderer='templates/frontend/displayCompany.mak')
def displayCompany(request):

    companyId = int(request.params.get('companyId'))
     
    try:
        company = DBSession.query(Companies).filter(Companies.id == companyId).one()
    except Exception as inst:
     err_msg = type(inst) + inst.args + inst
     return Response(err_msg, content_type='text/plain', status_int=500)

    return {'company': company}