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
5. Copy/link or make the media files under `<python installation>/site-packages/kecupuapp_base/media` available to the web server.
