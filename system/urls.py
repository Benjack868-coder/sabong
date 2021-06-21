from django.urls import path
from . import views

urlpatterns = [
    path('',views.index, name='system_app_index'),
    path('login/',views.Login.as_view(), name='system_app_login'),
]
