import os

from setuptools import setup, find_packages

requires = [
    'pyramid',
	'pyramid_mako',
    'pyramid_debugtoolbar',
    'pyramid_tm',
    'SQLAlchemy',
    'transaction',
    'zope.sqlalchemy',
    'waitress',
    ]

setup(name='pyJobs',
      version='0.0',
      description='pyJobs',
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pyramid",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='Federico',
      author_email='',
      url='',
      keywords='web wsgi bfg pylons pyramid',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      test_suite='pyJobs',
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = pyJobs:main
      [console_scripts]
      initialize_pyJobs_db = pyJobs.scripts.initializedb:main
      """,
      )
