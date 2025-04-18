from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .models import *
from .forms import ArtistSearchForm



def home(request):
    # corresponds with home.html <form method="POST" action="{% url 'home' %}">
    # if the action is POST
    if request.method == 'POST':
        # keys correspond to the name attribute in the form
        username = request.POST['username']
        password = request.POST['password']

        # Authenticate
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, "You have been logged in.")
            return redirect('home')
        else:
            messages.success(request, "There was an error logging in.")
            return redirect('home')
    # else the action is GET, so we just serve the home page
    else:
        return render(request, 'home.html', {'foo':'bar'})


# note: function is called login_user so that it doesn't conflict with imported functions
def login_user(request):
    pass


def logout_user(request):
    logout(request)
    messages.success(request, "You have been logged out.")
    return redirect('home')


def artists(request):
    artists = Artist.objects.all()
    return render(request, 'artists.html', {'artists': artists})
    return redirect('artists')

def artist_search(request):
    form = ArtistSearchForm(request.GET)
    artists = []

    if form.is_valid():
        artist_fname = form.cleaned_data.get("artist_fname")
        artist_lname = form.cleaned_data.get("artist_lname")

        query = {}
        if artist_fname:
            query["artist_fname__icontains"] = artist_fname
        if artist_lname:
            query["artist_lname__icontains"] = artist_lname

        if query:
            artists = Artist.objects.filter(**query)

    return render(request, "artist_search.html", {"form": form, "artists": artists})
