from django.shortcuts import render, HttpResponse
from django.views import View

# Create your views here.


def index(request):
    return HttpResponse('<h1> Norvin Tabale x Ivana Alawi</h1>')

class Login(View):
    def get(self, request, **kwargs):
        return render(request,'system/login.html', context={})

