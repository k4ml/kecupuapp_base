from django.conf.urls.defaults import *

# URL patterns for kecupu.base

urlpatterns = patterns('kecupuapp_base.views',
    # Add url patterns here
    url(r'^login/$', 'login', name='login'),
    url(r'^logout/$', 'logout', name='logout'),
    url(r'^profile/$', 'profile', name='profile'),
)
