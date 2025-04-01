from django import forms

class ArtistSearchForm(forms.Form):
        artist_fname = forms.CharField(label="First Name", max_length=100, required=False)
        artist_lname = forms.CharField(label="Last Name", max_length=100, required=False)

