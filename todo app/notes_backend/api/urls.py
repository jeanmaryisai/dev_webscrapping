from .views import getRoutes,getNotes,getNote
from django.urls import path

urlpatterns = [
    path('', getRoutes),
    path('notes/',getNotes),
    path('notes/<str:note_id>/',getNote),
]