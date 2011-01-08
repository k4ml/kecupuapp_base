Introduction
============
Base Django app with login/logout functionality. The premise is, to start new Django project, all we need to do is:-

1. Create a django project (settings.py and urls.py).
2. Enable kecupuapp_base in `INSTALLED_APPS`.
3. Point url pattern to kecupu.base app:-

<pre>
    cat - >> urls.py
    from django.conf.urls.defaults import *

    from kecupuapp_base import basesite

    urlpatterns = patterns('multilevel.views',
        (r'^$', 'index'),
        (r'^accounts/', include(basesite.urls)),
    )
    ^D
</pre>

4. Enable template context processor `kecupuapp_base.context_processors.base_site`.

Static Files
============
Use `django-staticfiles` app to easily manage static files. `kecupuapp_base.context_processors.base_site` defined template variables named `STATIC_URL` which default to `/static/`.

Define `STATIC_ROOT` in settings.py.

    ....
    INSTALLED_APPS = (
        ....
        'staticfiles',
    )
    STATIC_ROOT = /var/www/html/

    $ django-admin.py build_static --settings=project.settings

Above command would correctly copy all the static files to the specified `STATIC_ROOT` directory. `build_static` only copy media files under the `INSTALLED_APPS` directory. For media files under project directory, we can specify in settings:-
    STATICFILES_DIRS = (
        ('', os.path.join(os.path.dirname(__file__), 'media')),
    )

'' empty string mean we copy the files to the root of static root dir. 
