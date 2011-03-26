# Create your views here.
from django.contrib.auth.views import login as auth_login
from django.contrib.auth.views import logout_then_login
from django.contrib.auth.decorators import login_required

from kecupuapp_base.shortcuts import render_response 

def login(request):
    return auth_login(request, template_name='login.html')

def logout(request):
    return logout_then_login(request)

@login_required
def profile(request):
    return render_response(request, 'kecupuapp_base/profile.html')
