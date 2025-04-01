from django.urls import path
from . import views
from .views import artist_search
from .models import Artist

# path('', views., name=''),

urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login_user, name='login'),
    path('logout/', views.logout_user, name='logout'),
    path('artists/', views.artists, name='artists'),
    path("artist_search/", artist_search, name="artist_search"),
]