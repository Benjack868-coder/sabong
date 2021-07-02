# chat/routing.py
from django.urls import path

from . import consumers


websocket_urlpatterns = [
    path('matches/<int:derby_id>/auto-match/', consumers.AutoMatchConsumer.as_asgi()),
]