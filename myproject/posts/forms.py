from django import forms   
from . import models 

#let's create a new class 
class CreatePost(forms.ModelForm):
    class Meta: 
        model = models.Post
        fields = ['title', 'body', 'slug', 'banner']