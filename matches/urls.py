from django.http import request
from django.urls import path
from . import views

urlpatterns = [
    path('',views.Index.as_view(), name='matches_index'),
    path('<int:derby_id>/',views.Match.as_view(), name='matches_match'),
    path('<int:derby_id>/entry/<int:entry_id>',views.Entrys.as_view(), name='matches_entry'),
    
]
