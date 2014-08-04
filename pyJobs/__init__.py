from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import (
    DBSession,
    Base,
    )


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    config = Configurator(settings=settings)
    config.include('pyramid_mako')
    config.add_static_view('static', 'static', cache_max_age=3600)
    
    # Rutas
    config.add_route('home', '/')
    config.add_route('postNewJob', '/postNewJob')
    config.add_route('displayJob', '/displayJob')
    config.add_route('displayCompany', '/displayCompany')
    config.add_route('listJobs', '/listJobs')
    
    config.scan()
    return config.make_wsgi_app()
