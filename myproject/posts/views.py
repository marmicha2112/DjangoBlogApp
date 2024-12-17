from django.shortcuts import render, redirect
from .models import Post
from django.contrib.auth.decorators import login_required
from . import forms 
# from django.http import HttpResponse


# Create your views here.
def posts_list(request):
    posts = Post.objects.all().order_by('date')
    return render(request, 'posts/posts_list.html', {'posts':posts})

# Our post page function recieves 
# request and slug parameter 
# So now we can echo what it receives that slug
# To do that we need to import something here at the top 
# from django.http import HttpResponse
# and we are going to return HttpResponse(slug)
# this will let us confirm this is working 


def post_page(request, slug):
            # return HttpResponse(slug)
            post = Post.objects.get(slug=slug)
            return render(request, 'posts/post_page.html', {'post':post})

#@login_required is called decorator 
@login_required(login_url="/users/login/" )
def post_new(request): 
    if request.method == 'POST': 
        form = forms.CreatePost(request.POST, request.FILES)
        if form.is_valid(): 
              newpost = form.save(commit=False)
              newpost.author = request.user
              newpost.save()
              return redirect('posts:list')
    else: 
        form = forms.CreatePost()
    return render(request, 'posts/post_new.html', {'form': form})

