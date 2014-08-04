PyJobs
=======

A jobs board written in python.

###Version


Current version is **v0.0.1**

###License


PyJobs is open source software under the **2-Clause BSD License** (also known as *The FreeBSD License*). 
A copy of this license can be found at the OSI Website: http://opensource.org/licenses/BSD-2-Clause . 

###Directories


This file is in the application's top directory. 
The folders in the application are: 

- *startup*: contains files to start the application. As of this version it only contains Powershell scripts (Windows).
- *pyJobs*: contains the application itself. 
- *config*: contains the configuration files for development and production environments. 

###Support


In theory, any operating system that can run python is supported. 
In practice, it has only been tested on Windows. 

###Requirements to run


This application uses/requires:

- Python 3.
- Pyramid *(Web Framework).*
- Mako *(Template engine).*
- SQLAlchemy *(ORM)*.
- WTForms *(Form handling library).*.
- SQLite *(As a development database)*.

####Current status


As of this version, the application is not yet ready for production. The frontend works, but it still has
a few problems and it's far from being complete. The backends for admins and companies have not been implemented.

