- Install python 
- Check python version 
             python --verrsion
- Create a virtual environment 
- Open terminal 
    py -m venv .venv
-This creates .venv folder 

- Activate your virual environment 
    source .venv/Scripts/activate
- If you want to deactivate 
    deactivate

- Now let's install Django in our Virtual environment 
    py -m pip install Django 

    there will be a message one like 
    Successfully installed Django-5.1.1

- verify Django installation 
    python 
    import django 
    print(django.get_version())
    quit()

- LETS CREATE OUR PROJECT WITH Django
    django-admin startproject myproject

    * myproject = My project name 

- myproject now has associated folders +
- manage.py so now lets just start our django server
    django manage.py runserver

    cd myproject 

    python manage.py runserver

- server is running at http://127.0.0.1:8000

- Type that into your URL and it will launch your Django server page

- Ctrl + c in the terminal will quit the server from running

- Go to my project -> urls.py Open it and 
- let's add path in the urls.py file 
    urlpatterns = [
    path('admin/', admin.site.urls),
    path('', ), 
    path('about/', ), 
    ]

- create a file called views.py, in the same directory as of your urls.py file   
- Write your python code here 
    from django import HttpResponse

# Your python code goes here 

def homepage(request):
    return HttpResponse ("This is home , am home!!!")

def about(request): 
    return HttpResponse("My about page")


- Import the view to urls. py 
- First 
    from . import views  
    # ( . means all)
    
    from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.homepage), 
    path('about/',views.about ), 
]

- Now instead of sending a simple text, 
  let's throw an html page 

- Create a directory called template 

- Create home.html, and about.html, inside Templates 

- just have a simple html code in there

- Now go to myproject -> Settings.py

- Scroll a bit and reach out to TEMPLATES 

- add the template folder the one containg bout home.html and about.html 
  like what's underneath
    'DIRS': ['templates'],

- Next go to views.py and add the following
    
        #from django.http import HttpResponse
        from django.shortcuts import render 
        # Your python code goes here 

        def homepage(request):
            #return HttpResponse ("This is home , am home!!!")
            return render(request, 'home.html')
        def about(request): 
        # return HttpResponse("My about page")
            return render(request, 'about.html')

- ctrl + ~(backtik), to open a terminal

- run the server 
    python manage.py runserver 

- now check your website 

- Create a folder inside myproject directory called static

- Inside of static -> Create CSS folder/directory

- inside in CSS folder create a file called style.css


Video 02
-----------------------------------------------
- Install Extentions following cods
    1 - Django
    2 - vscode-icons

- Check python version 
             python --verrsion
- Create a virtual environment 
- Open terminal 
    py -m venv .venv
-This creates .venv folder 

- Activate your virual environment 
    source .venv/Scripts/activate
- If you want to deactivate 
    deactivate

- Now let's install Django in our Virtual environment 
    py -m pip install Django 

    there will be a message one like 
    Successfully installed Django-5.1.1

- verify Django installation 
    python 
    import django 
    print(django.get_version())
    quit()

- LETS CREATE OUR PROJECT WITH Django
    django-admin startproject myproject

    * myproject = My project name 

- myproject now has associated folders +
- manage.py so now lets just start our django server
    django manage.py runserver

    cd myproject 

    python manage.py runserver

- server is running at http://127.0.0.1:8000

- let's talk about apps in jango 

- ***let's just create an apps

    python manage.py startapp posts
        * posts = The app folder name
- this will create a new app in our django project

- now you can see already the views.py is already 
- Created and type the follwoing function 
    def posts_list(request):
        return render(request, '')

- Now we have to tell our python project about the 
- New app that we added to the project, 
- To do that go to the Settings file that we were in 
- Inside of myproject direcotry
- Open settings.py, go to INSTALLED_APPS
- and at the bottom add 

    'posts' 

- and save the file  

- Create a directory called 'templates' inside posts directory
- Inside of templates directory create another directory called 
  posts
- Create posts_list.html inside the post directory
- Open posts_list.html and type 
    ! and the tab key to get a skeleton 
- notice that this will not work 
- So, press Ctrl + , on the keybord to open the setting 
- Type emmet, in the search bar
- Go down to "Emmet: include languages 
- Click Add item 
- item = django-html    value = html 
- click Ok 
- Open posts_list.html and type 
    ! and tab, now you get the emmet auto completion  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Posts list</title>
</head>
<body>
    <h1>Post List</h1>
</body>
</html>

- Now go to "posts" directory, underneath create
    urls.py 

from django.urls import path
from . import views

urlpatterns = [
    path('', views.posts_list), 
]

- Now complete the views.py file 

from django.shortcuts import render

# Create your views here.
def posts_list(request):
    return render(request, 'posts/posts_list.html')

- Now register, posts.urls in the main project which is myproject

from django.contrib import admin
# Don't forget to use the "include" keyword 
# so that we can access /post app in our page
from django.urls import path, include
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.homepage), 
    path('about/',views.about ), 
    path('product/', views.product),
    path('posts/',include('posts.urls') ),
     # path('notfound/', views.notfound),
]

- open terminal 
    ctr + ~ 
- py manage.py runserver

    http://127.0.0.1/8000 

    open/type 

    http://127.0.0.1/8000/posts 

- will open Post Lists

- Now let's create the template page that we 
  are going to use for all the pages 
  in template folder 
- call it layout.html 


    <!DOCTYPE html>
{% load static%}
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        {% block title %}
            Django App
        {% endblock %}
    </title>
    <link rel="stylesheet" href="{% static 'css/layout.css'%}">
    <script src="{% static 'js/main.js'%}" defer></script>
</head>
<body>
    <nav>
        <a href="/">🏠</a>|
        <a href="/about">😀</a>|
        <a href="/">🗞️</a>

    </nav>
    <main>
        {% block content %}
        
        {% endblock %}
    </main>
</body>
</html>

- we have completed our template page 

- Remember we have also created layout.css in static > css folder 

- Now open the home page, remove everything and use the following 

    {% extends "layout.html" %}

    {% block title%}
        home 
    {% endblock %}

    {% block content  %}
        <h1>🏡</h1> <h1>This is the Home page</h1>
    {% endblock  %}

- This is the about page 
    {% extends "layout.html" %}

    {% block title%}
        About 
    {% endblock %}

    {% block content  %}
        <h1>🧠</h1> <h1>This is the About page</h1>
    {% endblock  %}


- Now go to posts_list.html, and put the following code
 
        {% extends "layout.html" %}

        {% block title %}
            post list 
        {% endblock %}

        {% block content%}
            <h1>📫</h1> <h1>This is the post page</h1>
        {% endblock %}

- run the server 
    python manage.py runserver 

- access 127.0.0.1:8000/posts


==================================
VIDEO-03
==================================
- Activate your virtual environment 
    source .venv/Scripts/activate
    cd myproject

- now go to the post directory 
- Open models.py 
 * They models data, and each type of data
  is going to have a table in the database, 
  so what happens when we create the pyton code 
  and the classes, by the way the models then they get 
  migrated and become tables in the database so the 
  migration takes our python code and turns it into 
  a database table 

  so for example we might have users and we will have posts
  and those would be two separate tables in our database 
  so we need to start out by creating our model in Python 
  and we're in the models.py  

from django.db import models

- Have the following code underneath 
# Create your models here.
class Post(models.Model): 
   title = models.CharField(max_length=75)
   body = models.TextField()
   slug = models.SlugField()
   date = models.DateField(auto_now_add=True)

- save the file 
Open the terminal Ctrl + ` (backtik)
python manage.py runserver 

- you see that following error 
 " You have 18 unapplied migration(s)...

- This is because Django comes with some of its 
  own built-in models as well, so we need to apply
  those migration also, and let's do that first

  - Ctrl + c (To quit the terminal)

- To apply those migration, type 

        python manage.py migrate 

- once you do that you can see that it applies 
  all migration from the built in models from django 
  provided, at this point 

- But this did not apply our post migration we need to 
  make that migration first before it can be applied 

- Now once again type 
    python manage.py makemigrations
output 
    Migrations for 'posts':
  posts\migrations\0001_initial.py
    + Create model Post

- Now you will see that it creates a migration for our 
  Post model we created and it tells us where this migration is 
  from the above output "posts\migrations\0001_initial.py" 

- look the number 0001, because Django is going to keep track 
  of these migrations, then when we create another one let's say 
  we change something about our post model we would need to
  make another migration at that point and when we do that 
  it is going to compare the migration, it's going to know 
  what it's already created in the database, it is only going 
  to take the action that it needs based on reconciling 
  what is already happend with the changes we have made 

- Now we have already created the migration and we need to apply it 

- Before applying it look at the "migration" folder 

- you can see inside that it wants to create this model the database 
 so if we created a migration in the future its not
 going to create the model again it will have already done so but this 
 this first time it needs to do that and we can see the different fields 
 we added as well 

- now let's apply it to the database by sending that 
migrate command: 
    python manage.py migrate

- now you can see instead of the error we get the message back 
output 
    Operations to perform:
  Apply all migrations: admin, auth, contenttypes, posts, sessions
Running migrations:
  Applying posts.0001_initial... OK

=====================================
VIDEO-04
=====================================
Jango ORM 
- run the server if it is down 
    source .venv/Scripts/activate

- ORM (Object Relational Mapping)
- It is a kind of intermidatory between our 
python code and our database. 

- we can execute something in our python code 
and then it goes ahead and carries out that action 
on the database

- so we have mapped what we are doing from our model 
to our actual database and that ORM kind of carries that out 
the command between the two 

Now let's do that 

Ctrl + c, to quit the server 

- and type 
    py manage.py shell 
    
    >>> from posts.models import Post
    # We can create a new instance 
    >>> p = Post()
    >>> p 
        output, <Post; Post object (None)> 
    >>> p.title = "My First Post!"
    # Now we should save this into our database 
    >>> p.save()
    # This is how easy working with ORM is in Django
    # Now we have saved that, let's retrive all the 
    # Post we have in our database, at this point we 
    # only have one and we can cofirm by typing 

    >>> Post.objects.all()
        # output be like 
        <QuerySet [<Post: Post object (1)>]>
        # you can see we have 1 
        # Exit the shell
    >>> exit()

- Open myproject > posts > models.py 

- we want to add a method to our post class

from django.db import models

# Create your models here.
class Post(models.Model): 
   title = models.CharField(max_length=75)
   body = models.TextField()
   slug = models.SlugField()
   date = models.DateField(auto_now_add=True)

   def __str__(self):
      return self.title 

-  we only add a def: here and it is not considered a 
- change in our data model, we don't need to crete another migration 
-  and send this to the database, what we have added is just a method 
-  that we can call on the model. so no migration is neccessry 

- open a terminal window, and start back on where we were in the begining 
  as far as shell is concerned 

    python manage.py shell 
    # import the post model 
        >>> from posts.models import Post
    # Create another instance 
        >>> p = Post()
    # Create a second post title 
        >>> p.title = "My Second Post" 
    # Save the post 
        >>> p.save()
    # Now we should have 2 post in our database 
    # Les's go and check that 
        >>> Post.objects.all()
    # Now when we get that query set in return, you can 
    # see instead of saying post object post my first post, 
    post my second post based on those titles that are inside of our Posts
    output 
        <QuerySet [<Post: My First Post!>, <Post: My Second Post>]>
    >>> exit()

- This is a little bit about  interacting with the ORM 
- that is built in Django, next lesson is we are going 
- to work with Django admin where we can add more post 
- and we will see how all of this can work inside of our 
- web app 



====================================
VIDEO-05 Admin tutorial 
====================================
- Djano admin feature 
- Go to MyProject -> urls.py 
- you can see that the admin route is available for us already
    path('admin/', admin.site.urls),
- start the server 
    pthon manage.py runserver
- Now in the URL type 
    127.0.0.1/admin
- It will ask you for a password 
- Go back to VS code 
    Ctrl + c, "To exit the server" 
- Now lets create super user that can acess admin panel 
- we can do that by typing 
    python manage.py createsuperuser
    * For username leav it blank to use cicdstudent hit enter
    * Email address: "You can simply escape this part by hitting enter" 
    * password: Eritrea@2023, 
    # Remember to enter your password twice 
    # Then Superuser created Successfully
- Run the server again 
    python manage.py runserver 
- Go to URL and type 
    127.0.0.1:8000/admin
    username: cicdstudent
    password: Eritrea@2023
- Now you will be logged in to Django Admin panel 
- Click on user, because we have a user. 
- you can see cicdstudent
- Beside managing user, we can use this admin panel 
- CMS(Content Managment System). right now we don't have  
- anything in the admin panel, remember we have created 
- posts but we don't see any of those 
- Go back to VS-Code and lets set it up and we do see 
- posts inside the admin panel 

- Go to posts Dirctory 
- And go to Admin.py file 
- you can see it says Register your models here. 
- so we need to add those models in this file 

    from django.contrib import admin
    # Import it
    from .models import Post

    # Register your models here.
    admin.site.register(Post)

- Save it 
- Quit the srever, Ctrl + C 
- kick it up onec again 
    python manage.py runserver 

- Now go to the admin page 
    127.0.0.1:8080/admin 

- Now in the admin panael, you will see Post
- If you click it you will see 
    My First Post, and 
    My Second Post 
- let's go and update "My First Post" 
    Title: My First Post 
    Body: I have added my first post 
    slug: first-post 
        remember the slug is what we would see at the end 
        of url 
- Save it, but remember all filed are required, 
  if you are editing from the admin panel 
- we can also add a post, click on it and add 
    Title: My Third post
    Body: This is my third post 
    slug: third-post
- and Save it

- Now let's go back in VS code and display this information 

- Go to views.py file in posts
from django.shortcuts import render
from .models import Post
# Create your views here.
def posts_list(request):
    posts = Post.objects.all()
    return render(request, 'posts/posts_list.html', {'posts':posts})

- Now let's go to posts > templats > posts_list.html file  edit it as following

{% extends "layout.html" %}

{% block title %}
<h1>📫</h1> post list 
{% endblock %}


{% block content%}
    <section>
        <h1>T post </h1>
        {% for post in posts%}
            <article class = "post">
                <h2>{{post.title}}</h2>
                <p{{post.date}}></p>
                <p>{{post.body}}</p>
            </article>
        {% endfor %}
    </section>
    
{% endblock %}

- run the server 
- Go to 127.0.0.1:8000/admin 
- Go to site, and click view site. 

- Make the newest post at the top 
- Go back to VS-Code 

- Go to the views.py inside in our posts directory
- add order_by('date')

from django.shortcuts import render
from .models import Post
# Create your views here.
def posts_list(request):
# -date means the newest at the top 
    posts = Post.objects.all().order_by('-date')
    return render(request, 'posts/posts_list.html', {'posts':posts})

- Now go back and refresh the page 

=====================================
VIDEO 06, PYTHON DJANGO PAGES, URLs, SLUGs 
-------------------------------------
- Let's build Individual post pages in Django 
- and the pages are identified with slugs and named URLs
- Start virtual environment 
    source .venv/Scripts/activate 
    cd myproject

- python manage.py runserver 
    localhost:8080/admin 
    username: cicdstudent
    password: Eritrea@2023

- Add some post 

- Now back to myproject directory > posts app
  and to the urls.py file 

- add a parameter called name="posts"
        from django.urls import path
        from . import views

        urlpatterns = [
            path('', views.posts_list, name="posts"), 
        
        ]
- Now that we might wonder why do we add a name 
 to this URL and how do we use it 

- let's go to the top level templates directory
- inside it we do have "layout.html" template 
- now if you see in the layout page 
    <nav>
        <a href="/">🏠</a>
        <a href="/about">😀</a>
        <a href="/posts">🗞️</a>
    </nav>
- we see the traditionl link 
    <a href="/posts">🗞️</a>

- This can be replaced 
    <a href="{% ursl 'posts' %}">🗞️</a>

- Now we are refering to that name we gave in the 
  URLs file here where we have name equlas posts this 
  is what we are refering to in our layout file inside of 
  out template language. 

- Now let's go to chrome 
    127.0.0.1:8000

- Now click on our post Icon and it should work 
- See that we now using that named URL as we navigate to the post list

- Now we want to create  for each of our post so that we 
  can navigate to the individual post pages 

- Go to Django documentation and go to " Path converters" 
    " from the documentation, the following path converters are available by default" 
    str
    int 
    slug: Mathces any slug string consisting of ASCII letters or numbers 
          plus the hyphen and underscore charachters, For example.
          "Building-your-1st-django-site. 
    uuid: 
    path: 

- wich in our case we will be using the slug
- now let's go back and apply this in our applications 
- open urls.py 
    - go to the end of the line and 
    - hold "Shift + Alt + downArrow" to copy the line 

- path('<slug:slug>', views.post_page, name="page"),
    * slug, to the left is representing the slug 
    * the slug after the " : " is representing the parameter 
    * After that we have views.post_page, we haven't create the functions 
      to create the post page yet or route to it 
    * So remember we need to create a function with exact same name "post_page"
      in our views.py file
    * name tis page, page 
        name="page" 
    * save the page with this changes 

- now let's create the post_page file, 
 * Underneath posts directory, go to views.py 

 from django.shortcuts import render
from .models import Post
from django.http import HttpResponse


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
            return HttpResponse(slug)

- Now let's go up inside of our posts app
- To the template directory in the post 
- and let's go to posts_list.html and modify in the <article> tag 
<article class = "post">
                
                <h2>
                    <a href="{% url 'page' slug=post.slug %}">
                         {{ post.title }}
                    </a>
                </h2>
                
                <p>{{ post.date|date:"F j, Y" }}</p>

                <p>{{ post.body }}</p>
            </article>

- and let's try it, 
    127.0.0.1:8000 
    go and clcik the post icon 
- and see the links are changing 
- and if you clcik "My first blog"
- you should be routed to the slug saying first-post

- Now go to urls.py, the one that's in posts app, and add 
    app_name = 'posts'

- Now we designated the url paterns are inside in the post apps 
- Code will look like 
    from django.urls import path
from . import views

app_name = 'posts'

urlpatterns = [
    path('', views.posts_list, name="list"),
    path('<slug:slug>', views.post_page, name="page"),
   
]

- Now let's chang ethose links we have created 
- Remember one we careated in the layout 
- Template > layout 

     <a href="{% url 'posts' %}">🗞️</a>
     
- Instead of the abov code we replace it with 
     
      <a href="{% url 'post:list' %}">🗞️</a>

- So now it is going to specifically refer to the named URL list 
  Inside of the posts app 

- Now go to the posts > templates > post_list.html 

<h2>
    <a href="{% url 'page' slug=post.slug %}">
        {{ post.title }}
     </a>
 </h2>

- change url 'posts:page' like the following 

<h2>
    <a href="{% url 'posts:page' slug=post.slug %}">
        {{ post.title }}
     </a>
 </h2>

- Now specifically the named URL page inside of the post app

- now check if it works 
    127.0.0.1:8000

- Now it seems everything works, now let's go ahead and make 
  change here to our views.py

  posts > views.py 

- Because we are using this HTTP response, we really want to use 
a page template not just echo the slug we actually 
want to present a post page 
- start by deleting 
    from django.http import HttpResponse 

from django.shortcuts import render
from .models import Post

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

- Now we need to create the post_page.html 
    Go to posts > templates > posts 
        create posts_page.html 

- code will look like 
    {% block title %}
    <h1>📫</h1> {{ post.title }}
{% endblock %}

{% block content%}
    <section>
        <h1>📫 {{ post.title }} </h1>                   
        <p>{{ post.date|date:"F j, Y" }}</p>
        <p>{{ post.body }}</p>
    </section>
{% endblock %}

- Now let's just check it out, on our post page 
when we click the link it should route to us a page 

===============================================================
Video 07 PYTHON DJANGO IMAGES, HOW TO UPLOAD AND DISPLAY IMAGES
===============================================================
- We want to add images to our project
- Go to myproject > myproject  > settings.py file 
- Scroll down in the setting.py to the place wehere we define a static path 
- add a MEDIA_URL Where we will find our images 
    MEDIA_URL = 'media/' 
    MEDIA_ROOT = os.path.join(BASE_DIR)

        MEDIA_ROOT = is saying where that direcotry is going to be 
        BASE_DIR = This means our top level myproject directory  

        STATIC_URL = 'static/'

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static')
]

MEDIA_URL = 'media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

- We haven't created 'media' directroy yet, it will get created 
  on its own when we upload an image 

- Save the file 

- Go to myproject > urls.py 
- Open it Scroll down in it where you can see 
    urlpatterns = [ 

    ]
- let's just make a couple of imports and then afterwards set a pattern 

- For the import 
    from django.conf.urls.static import static 
 - you need to call also call the setting that you have defined 
    from django.conf import settings 

- crate 
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT )
- Here we are just defining the MEDIA_URL we have just defined 
  in the settings 

- TIP Alt + Z, will wrap a long line of code in VS code 
- The entire code will look like 
        from django.contrib import admin
        from django.urls import path, include
        from . import views
        from django.conf.urls.static import static 
        from django.conf import settings

        urlpatterns = [
            path('admin/', admin.site.urls),
            path('', views.homepage), 
            path('about/',views.about ), 
            path('product/', views.product),
            path('posts/',include('posts.urls') ),
            # path('notfound/', views.notfound),
        ]

        # Tip you can press Alt + z, to wrap a long line code 
        urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

- now let's go to our "posts" and go to the models.py file 

- before we make any changes, to our models.py file we need to install.
- We started our virtual enviroment so we putting all of our dependencies in 
  that environment 
 - Now open a terminal window and type 
    pip install pillow 
- This is going to help us here as we use images 
- Add someting to our post and call it "banner", so we can 
  add a banner to all of our post in the application 
- models.py 
    banner = models.ImageField(default='fallback.png', blank=True)

- The entire models.py code looks like 
        from django.db import models

        # Create your models here.
        class Post(models.Model): 
        title = models.CharField(max_length=75)
        body = models.TextField()
        slug = models.SlugField()
        date = models.DateField(auto_now_add=True)
        banner = models.ImageField(default='fallback.png', blank=True)
        
        def __str__(self):
            return self.title 

- if we make anychages to our model, rember we need to do 
  migration, to the database 
- in the terminal window 
    python manage.py makemigrations
    output
    -------
    Migrations for 'posts':
  posts\migrations\0002_post_banner.py
    + Add field banner to post 

- Now from the output looks like everything went as planned so we 
  have made the migration, now let's apply it to our databse using the command 
    python manage.py migrate 

    this is successfull 

- Let's see this changes by running our servers 
    python manage.py runserver 

- Now open up the server and go to the admin panel 
    127.0.0.1:8000/admin 
    if asked username and password 
        127.0.0.1:8000/admin
        username: cicdstudent
        password: Eritrea@2023

- now let's look at the post, and click myfirst post 
- you can see there is a banner area along with everyting 
  else that we previously had for our posts   
  and notice it's got currently the fallback.png that we deined 
  ofcourse we haven't put that in our media file yet, we don't even 
  have a media folder, but we will as soon as we sart adding some images 
- Right after login to the admin page go and open "My first Post" 

- Noitce that in the Banner section where it says currently: you can see the "fallback.png" 
  file, the default image file, Remember we haven't put that file in our media file yet 
  we don't ven have a media folder, but we will as soon as we start adding some folders 
- Now upload some files, in myfirstpost, mysecondpost, mythirdpost, myforthpost 

- After uploading the files and if we go to our site we are not 
  going to see the images 

- Now why don't we see our images? because we haven't added them to our template, lets add them 

- Back to VS code, check whether our media directory is created or not, you can check it 
  in "myproject" > "media", if you uncolaps it you will see the picutes that you have uploaded. 

- We didn't created it, django created it as we added images 

- now we can create our fallback.png image and save it in our medida file, 
  This will sever as a default image if we haven't used one

- Now go to "posts" > templates > posts > post_page.html 

- Now img tag 
    <img 
        class="banner"
        src="{{ post.banner.url }}" 
        alt="{{ post.title }}" 
        />
- add some styling to the page, remeber our style page for the template 
  we have driven the post_page.html is in, static > css > layout.css 

- Open it and put at the end 
    .banner {
        display: block; 
        width: 100%; 
        max-width: 800px; 
    }

- At this point run the server again and when you click myfirstpost in 
  the page it will open the content along with the picture. 

  ===========================================================
    Video 08 PYTHON DJANGO CHALLENGE FOR BEGINERS WITH SOLOUTION
  ===========================================================

- Create a register page 
    127.0.0.1/user/register  should load the register page 

- Just like the post app we need to create the user app 
- go to myproject the top project directory 
-  and let's create a user app 
- Stop the server if it is running and type 
    python manage.py startapp users
- The above code will create the users app same exact like whene we create the app. 

- Now go to myproject > myproject, 
      remeber the second myproject directory is the parent directory of course for
      our project and it has the master settings we need to tell it about the users 
      app 
- Go to myproject > settings 
            INSTALLED_APPS = [
            'django.contrib.admin',
            'django.contrib.auth',
            'django.contrib.contenttypes',
            'django.contrib.sessions',
            'django.contrib.messages',
            'django.contrib.staticfiles',
            'posts',
            'users',
        ]

- save it 

- go to users app (directory) and create urls.py and write this inside it 
        from django.urls import path
        from . import views

        app_name = 'users'

        urlpatterns = [
            path('register/', views.register_view, name="register"),
        ]

- Now go to the upper directory i.e myproject > urls.py 
    we need to tell the path to our users app to it. in the urlpattenrns 

        path('users/',include('users.urls')), 

- Back to users > urls.py 
    In the urls.py we referenced a view  (views.register_view)
    we haven't created that yet so we need to go to our views.py 
    in users file, and create that function we mentioned in the urls.py 

- Now notice in users > views.py file django already imported 
from django.shortcuts imort render 
# Create your views here 

    from django.shortcuts import render
    # Create your views here.

    def register_view(request): 
        return render(request, "users/register.html")

- Save the changes 

- We haven't create register.html template yet but we will 

- Click the users directory > create "templates" directory

- inside the templates directory > create  another directory named users 
  inside users create > register.html

    {% extends "layout.html" %}

    {% block title %}
        📫 Register a user 
    {% endblock %}

    {% block content %}
        <section>
        <h1> ◯ Register page </h1> 
        </section>
    {% endblock %}

- now right after this go to the top project directory 
  myproject > templates > layout.html and add 
  the following anchor tag 
          <a href="{% url 'users:register' %}">
            <span role='img' aria-label='register'>🤺</span> 
          </a>

- run the server 
    python manage.py runserver 
    and check 127.0.0.1/users/register 
    or click the register icon 
    at this point you should be able to get the page 

=================================================
09 PYTHON DJANGO USER REGISTRATION FULL tutorial
=================================================
- Start your virtual server 
    source .venv/scripts/avtivate 
- After the virtual environment installed 
    cd myproject 

- Let's go to myproject > users > views.py 
- Add 
    from django.contrib.auth.forms import UserCreationForm
- you don't really need to memorize this things 
- and what we are doing here is importing a form django 
  already provides a lot of the authentication we need to add 
  and this is something cool otherwise it would take us a long
  time to create   
- after we have that imported we need to create the form in our 
  register view funtion 
    form = UserCreationForm()
- and finally we need to pass in that third parameter that we 
  have seen before 
    return render(request, "users/register.html", {"form": form})
- save is for now, and it is going to create the form 
  and pass it to our register template, we havent't created anything 
  else except <h1> tag from the previous lesson 


        from django.shortcuts import render
        from django.contrib.auth.forms import UserCreationForm

        # Create your views here.

        def register_view(request): 
            form = UserCreationForm()
            return render(request, "users/register.html", {"form": form})

- Now look at in users > templates > users > register.html 

- Add a form page 

        {% extends "layout.html" %}

        {% block title %}
            📫 Register a user 
        {% endblock %}

        {% block content %}
            <section>
            <h1> ◯ Register page </h1> 
            <form class="form-with-validation" action="/users/register/" method="post">
                    {% csrf_token %}
                    {{ form }}
                    <buttom> Submit </button> 

            </form>
            </section>
        {% endblock %}

- django also provides some security through a CSRF token and 
  that stands for cross-site request forgery, so it is ensuring that 
  this form is being submitted from our site and not something pretending to be 
  our site and to do that we have to include that CSRF token and we 
  can do 

- let's just start the project and see if our form is working 
- run the server 
    python manage.py runserver 

- Now we need to add the code that will actually save the user
  after we submit the form, and it requires some conditional logics 

- Go to Users > views.py, this is the place where we can apply 
  conditional logic, now we need one more import at the top 

    from django.shortcuts import render, redirect 

- we need the redirect function because if we successfully save 
  a user then we are going to redirect back to the post list 
  now inside of of our view function we will start our conditional 
  logic with an if statment 
    
        if request.method == "POST":
            form = UserCreationForm(request.POST)
            if form.is_valid(): 
                form.save()
                return redirect('login')
        else: 
            form = UserCreationForm()

from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm

# Create your views here.

def register_view(request): 
    # if the form is submited and if it is a POST metho 
    if request.method == "POST":
        # The form validation checks here, if the user is 
        # already exist or not, if not it will just to the 
        # else statment  
        form = UserCreationForm(request.POST)
        if form.is_valid(): 
            form.save()
            return redirect("posts:list")
    else: 
        form = UserCreationForm()
    return render(request, "users/register.html", {"form": form})

- Save it, and go back to the page 
    127.0.0.1:8000
    shift + Refresh ( To see quick changes )

- Create a new user and submit it , 
    username: Million 
    password: pythoniscool1
    re-type password: pythoniscool1
- Now see, it will create the new user and take us to the post page 
  , reirect also works 

- Now let's type 
    127.0.0.1/admin 
    and login with 
        username: cicdstudent 
        password: Eritrea@2023

- Now clcick user, 
    Now you can see the user, Million and Tony with red x, 
    with not admin access 

- before wrapping up, add a nav bar to our user app, 
- Go to myproject > template > layout.html 
  and add this. 
            <a href="{% url 'users:register' %}">
            <span role='img' aria-label='register'>🤺</span> 

TIP 
    shift + alt + down arrow   ( To copy the whole line)


======================================================
VIDEO 10, DJANGO LOGIN FORM AND USER AUTHENTICATION 
======================================================
- We are going to see how to add user login and authentication 
  in our Django project 
- open a terminal window 
    source .venv/Scripts/activate   { To activate a virtual environment }
    cd myproject   { Be in your project folder }
    python manage.py run server    {Start the server}

- let's add another login page in our VS code, so go to VS code 

- go to myproject folder > templatea > layout.html 

- Inside layout.html, page go to the last anchor tag hightlight it and 
  shift + Alt + DownArrow key to duplicate it 

        <a href="{% url 'users:login' %}">
            <span role='img' aria-label='login' title="User login">🔏</span> 
        </a>
- Now let's go to Users > Urls 
- in the urlpatterns, create the following link 
        path('login/', views.login_view, name='login'), 
- Now go to views.py and we need to create the function "login.view"
- We need to include/import AuthenticationForm
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm

- the funciton looks something like 
    def login_view(request):
    if request.method == 'POST':
        return redirect("users:login")
    else:  
        form = AuthenticationForm()
    return render(request, "users/login.html", {"form": form})

- Now let's add login.html, in: 

    Go to Users > templates > Users 
    create login.html
    {% extends "layout.html" %}
{% load static %}


{% block title %}
    📫 login a user 
{% endblock %}

{% block content %}
<link rel="stylesheet" href="{% static 'css/register.css' %}">
    <section>
       <h1> ◯ Login page </h1> 
       <form class="form-with-validation" action="/users/login/" method="post">
            {% csrf_token %}
            {{ form }}
            <button class="form-submit"> Submit </button> 
       </form>
    </section>
{% endblock %}

- Go back to the view file and have this function in place 
        def login_view(request):
            if request.method == 'POST':
            form = AuthenticationForm(data=request.POST)
            if form.is_valid(): 
                # LOGIN HERE 
                return redirect ("posts:list")

            else:  
                form = AuthenticationForm()
            return render(request, "users/login.html", {"form": form})

- Now run the page 
    127.0.0.1/8000
- you will see an icon a lock icon  click on it and try to log in 
  with a fake account 
    eg. Username = test     password = test1 

- It will be rejected and says "Please enter the correct username and password" 
    username: cicdstudent
    password: Eritrea@2023

- This would log in and takes you to the post page 

- Back to vs code users > views.py 
- we have one more import to add 
    from django.contrib.auth import login

    # What's added is this 
        def login_view(request):
    if request.method == 'POST':
       form = AuthenticationForm(data=request.POST)
       if form.is_valid(): 
           login(request, form.get_user())
           return redirect ("posts:list")

    else:  
        form = AuthenticationForm()
    return render(request, "users/login.html", {"form": form})

- It would also be nice if we logged in users as they registred 
- once they've registred they should be logged in and not have 
  to take extra step
- in user > view.py 
    in the 
    def register_view(request): function 
        # see the part that says 
        form.save()
        # This part is saying save a new user. 
        # and it acutally returns the users value also 
- Now we can modify that 
        login(request, from.save())     
        # This is also return a user value 
    
- The whole modifyed code would be like 
    from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth import login 

# Create your views here.

def register_view(request): 
    # if the form is submited and if it is a POST metho 
    if request.method == "POST":
        # The form validation checks here, if the user is 
        # already exist or not, if not it will just to the 
        # else statment  
        form = UserCreationForm(request.POST)
        if form.is_valid(): 
            login(request, form.save()) 
            return redirect("posts:list")
    else: 
        form = UserCreationForm()
    return render(request, "users/register.html", {"form": form})

def login_view(request):
    if request.method == 'POST':
       form = AuthenticationForm(data=request.POST)
       if form.is_valid(): 
           login(request, form.get_user())
           return redirect ("posts:list")

    else:  
        form = AuthenticationForm()
    return render(request, "users/login.html", {"form": form})

- Now test it, before we do let's go to 
127.0.0.1/admin 
- just to check that you are not logged in, if you are just log out of it 

- Now go back to the page 127.0.0.1:8000/
- click on the "lock" or on  the login 
and use your credentials 
        username: cicdstudent
        password: Eritrea@2023

- when you click login it will take you to the post list 
- Now if you go to 
    172.0.0.1:8000/admin   it shouldn't ask you to log in 
    means our singing page works as expected 
- Now log out, and what if we registre a new user. 

    username: Helen
    psasword: Million123 

- after submitting it will directly takes you on to the post page 

- now Helen is not an admin, how to check 
 go to 127.0.0.1:8000/admin
    # You will see a message saying "you are authorized as helen 
      but are not authorized to access this page. would you like 
      to login to a different account? 
- which is good, we can log in to: 
        username: cicdstudent
        password: Eritrea@2023
- And verify that Helen is in th elist an dwe can see 
  that everying works as it is intended 


======================================================
VIDEO 11, PYTHON DJANGO USER AUTHORIZATION TUTORIAL  
======================================================

- Start the virtual environment 
    source .venv/Scripts/activate 
    cd myproject 

- In this step we want to provide authorization i.e protect 
  pages to anyone that is not logged in to do this we need to 
  create a log out so we can test users that are logged in and
  test users that are logged out 

- myproject > users > urls.py 
- add 
      path('logout/', views.logout_view, name='logout'), 
the compelete code 
from django.urls import path
from . import views

app_name = 'users'

urlpatterns = [
    path('register/', views.register_view, name="register"),
    path('login/', views.login_view, name='login'), 
    path('logout/', views.logout_view, name='logout'), 
]

- Go to views and wite out the logout functions 
- before that in the views file we need to import log out 
    from django.contrib.auth import login, logout

    # Add the following code at the bottom 
    def logout_view(request): 
def logout_view(request):
    if request.method == "POST":
        logout(request)
        return redirect ("posts:list")
    
- go to the parent directory myproject > template > layout.html
 and add at the bottom of the nav tag 
    <form class="logout" action="{% url 'users:logout' %}" method='post'>
       {% csrf_token %}
       <button class="logout-button" aria-label="User logout" title="User Logout"> 🧱</button>
    </form>

- run the server from the terminal, python manage.py runserver
now go to the url and type 127.0.0.1:8000/admin 
if not logged in, just log in, and click back to view site 

- Now click our 👋 logout button and it should take us to the the post 
  page as it is intended to 
- just to check go to the admin page 
    127.0.0.1:8000 to see that we are logged out

- Now let's create a page we want to protect, in ohter 
  word we need to be logged in to be authorized to view that page 

- let's go to the Posts directory > urls.py  

- put in another pattern to a page where we would 
  create a new post where we would allow users that are 
  logged in to create a new post 

- we have to be specific about where we put it because of the 
  slug 
- if we put it underneath the slug this is going to catch 
  whatever we put first and assume it's a slug so we actually 
  put this new line above the slug line 

- Go to myproject > posts > urls.py 
- we have to add right above the slug in the urlpatterns 
   
    path("new-posts/", views.posts_new, name="new-posts")

- The whole code looks like something like this 
from django.urls import path
from . import views

app_name = 'posts'

urlpatterns = [
    path('', views.posts_list, name="list"),
    path('new-post/', views.post_new, name="new-post"),
    path('<slug:slug>', views.post_page, name="page"),
  
]
- save it 

- now let's go to posts > views.py and  create that new function 

def post_new(request): 
    return render(request, 'posts/post_new.html')
- save the file 
- See posts/post_new.html remember we haven't created it 
- Now go to the template inside in the post app 
    i.e Posts > template > posts 
- now create post_new.html 

{% extends "layout.html" %}

{% block title %}
    📫 new post
{% endblock %}

{% block content %}
    <Section>
      <h1> New post </h1>
    </Section>
{% endblock %}

- Now we need to go to myproject main directory > template 
  > layout.html 
- we need to create a link for our post_new.html page 

        <a href="{% url 'posts:new-post' %}">
            <span role='img' aria-label='New post' title="New post">🆕</span> 
        </a>

- at this point anybody can click and view the posts page, 
  we want to protect the page so now let's go to the posts app / directory

- posts > view.py 
- now we need an import before we proceed 

    from django.contrib.auth.decorators import login_required

- to use a decorator we put it directly above the post_new function

@login_required(login_url="/users/login/" )
def post_new(request): 
    return render(request, 'posts/post_new.html')


- so what is this @login_required(login_url="/users/login/" ) 
  do exactly, well it checks when this, whatever 
  function beneath it runs check if the user is logged in and if
  they are not logged in it redirects them to /users/login url   
  that we have provided 

- and this in place let's check in in the web browser 

- make usre that you logged out and if you click our new button 
i.e new page, it should take you to the login page before it displays 
the post 

- now if you log in then it will take you to the post page 

- now again if you click on the new post page then it will give you access 

- go ahead and logout one more time 
 go to 127.0.0.1/admin > click logout 
 and go back to 127.0.0.1 
 - Then if you click new you will be back to the user login 
 - Notice in the url parameter 
    http://127.0.0.1:8000/users/login/?next=/posts/new-post/
- That you have a parameter called "?next"
- It is saying after I login likely want to go back to that new-post page
  that i tried to access, what we know right now when we are login we are
  get taken to the post list 
- Lets just change this we try to go back to the new post page and we were 
  redirected to the login after we login, it should take us back to that our 
  new post page   

- let's go back to vs code 

- User > template > login.html 
- Add some underneath to the form 
            {% if request.GET.next %}
                <input type="hidden" name="next" value="{{ request.GET.next }}">
            {% endif %}
- the above code simply checks if the current HTTP request has a "next" parameter 
  in the query string, and if so, it renders a hidden input field with the value 
  of that parameter.

- save the code, and let's go to view page 
    users > view.py and let's modify our login view function 
    because the post request might be sending in the next value 
    as well, right now when we log in no matter what we get sent to 
    the post list but we need to conditionally check and if we have
    that next value we want to go there instead of the post list 

    let's add code between the login function and the current return 
    redirect that we have 

    if 'next' in request.POST: 
        return redirect(request.POST.get('next'))
    else: 
        return redirect("posts:list")

- The whole login_view function looks like
    def login_view(request):
    if request.method == 'POST':
       form = AuthenticationForm(data=request.POST)
       if form.is_valid(): 
           login(request, form.get_user())
           if 'next' in request.POST: 
               return redirect(request.POST.get('next'))
           else: 
               return redirect ("posts:list")
    else:  
        form = AuthenticationForm()
    return render(request, "users/login.html", {"form": form})

- Now let's chekck in chrome, just pull the browser back up 
- log out, if you are logged in 
    127.0.0.1:8000/admin 
- click new-post page icon, and login and see if we get 
  redirected back to the new post page, instead of getting 
  sent to the post list  

- checked, that we are sent to the "New post list" instead of the post list 

- Now let's just logout once again and, go to the home page 
 and go to signin page, so i am not going to the new post page 
 now when we log in we should be redirected to the post list instead 
 of the new post page, and that's what happen as well, so this 
 also works as we want it as well 

- One other thing to do, is conditionaly showing some of the options 
  in the Navbar, right now we are showing everything 

- you we are signed out but we are still showing the sign out link and 
  we are also still showing the new post page even though we shouldn't 
  be authorized to view that new post page,

- So we should only show these if we're signed in 

- likewise the user registration and signing in should probably only show 
  if we are logged out, so let's make thoes changes

- Back to VS code 
    myproject > template > layout.html, where we have our navbar 

- In template we have acceess to the user object so we can check 
  that so before the new post then our form that let us logout 
  and put in a conditional check




======================================================
VIDEO 12 PYTHON Django Forms tutorial 
======================================================

- Activate the environment if it is not. 
    source .venv/Scripts/activate 
    cd myproject 

- Today we will create a custom form that will add new post 
  to our applications 

- myproject > posts 
    create forms.py 

- we are not creating it completly from the start, Django 
  does provide a little bit of information for us 

- let's start out 
    from django import forms   
    from . import models  

    #let's create a new class 
class CreatePost(forms.ModelForm):
    class Meta: 
        model = models.Post
        fields = ['title', 'body', 'slug', 'banner']

- go to views.py in side of the posts directory 
- we will have one additional import at the top 
    from .import forms 

- This is just the file we had just created with our form in it 

- let's add 
    form = forms.CreatePost()    in 

    @login_required(login_url="/users/login/")
    def post_new(request): 
        form = forms.CreatePost()
        return render(request, 'posts/post_new.html')


- now let's go to our template 
    posts > templates > posts > post_new.html 

- Here we need to add the form that will be now available 
  to this template 
- The whole form content looks like 
{% extends "layout.html" %}

{% block title %}
    📫 new post
{% endblock %}

{% block content %}
    <Section>
      <h1> New post </h1>
      <form class='form-with-validation' action="{% url 'posts:new-post' %}" method="post" enctype='multipart/form-data'>
        {% csrf_token %}
        {{ form }}
        <button class="form-submit">Add Post</button>
      </form>
    </Section>
{% endblock %}

- now run the server and check it out

- back to vs code, go to posts > views.py 

- Till this point we currently receive the empty form we created 
  and it is passed on to the template, so we need to handle this 
  logic much like we did the user logic because this should be a 
  post request, so we are first going to check for that 

- now let's go and login to the admin 
    127.0.0.1:8000/admin 
- select POSTS, posts, select them all, and from 
- Action Delete selected posts 
- Now if we go to the site, we shouldn't see any post  

- Back in VS-code let's go to 
    posts > models.py file 

- here we are going to want to add author for our 
  post and the author is going to be the user 
  that's logged in, so let's import the user 

  from django.contrib.auth.models import User

- after that we are going to assign an author for our 
  post so let's create it 

  here we have more that one table, we have a user table 
  and we have a table that stores the posts, now these two
  tables will be related to each other, because one user could 
  create many posts so it will need to link to that user 
  every time you create a post. 

  so the author is going to be a foreign key in the post 
  table 

     author = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
- The whole model.py code 

        from django.db import models
        from django.contrib.auth.models import User

        # Create your models here.
        class Post(models.Model): 
        title = models.CharField(max_length=75)
        body = models.TextField()
        slug = models.SlugField()
        date = models.DateField(auto_now_add=True)
        banner = models.ImageField(default='fallback.png', blank=True)
        author = models.ForeignKey(User, on_delete=models.CASCADE, default=None)
        
            
            def __str__(self):
                return self.title 


    - The delete part is required, that's telling the database 
      how to handle your data if this relationship is deleted and 
      cascade ( means if this user gets deleted out of the user 
                table it's going to delete all of their posts out 
                of the post table too so it doesn't have broken 
                relationship )

- Now rememember we have updated or changed our model.py 
  so we definetly need to do migration, anythime you change a 
  model you then need to make migrations and migrate those changes 
  to the database, 

- Make sure the server is not running Ctrl + c 
  and type 
    python manage.py makemigrations 
- and press enter, so that it will be applied 
    output: 
        $ python manage.py makemigrations 
            Migrations for 'posts':
            posts\migrations\0003_post_author.py
                + Add field author to post
- Now say 
    python manage.py migrate
    Output:
        $ python manage.py migrate
            Operations to perform:
            Apply all migrations: admin, auth, contenttypes, posts, sessions        
            Running migrations:
            Applying posts.0003_post_author... OK

- Now we can run our server, 
    python manage.py runserver 

- Now how do we want to see the author 
let's go to posts > templates\posts > posts_list.html

and add post.author, as shown 
     <p>{{ post.body }} by {{ post.author}}</p>

- So we see that who wrotes what, now save it 

- let's go to the views.py and add the following code 
  underneath 

- Add the following underneath the if statment 
              newpost = form.save(comit=False)
              newpost.author = request.user
              newpost.save()
              return redirect('posts:list')

save it and let's give it a try 

and all seem to work 

CONGRADULATION THAT I HAVE GOT A COMPLETE 
DJANGO BLOG APP THAT WORKS 

- couple of updates 

- Go to Myproject > myproject > settings.py file 
- this settings going to help you deploy your applications 
  there are some changes you have to make for static files 

    * so in Setting.py, around line 12, we no longer need
        "import os" you can delete or commented it out 

    * Around line 25 it says DEBUG = True, and this is a security 
      warning don't run with debug turned on in production so if 
      you are going to deploy it make DEBUG = False

    * Around line 27, we need to specify 
      ALLOWED_HOSTS = ["localhost", "127.0.0.1"]

    * Around line 125, since we commented out/delete "import os" 
      then we need to make a clean up where we were using it 

     cut MEDIA_URL = 'media/' and put it underneath 

     STATIC_URL = 'static/'
     MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

    also create 
        STATIC_ROOT = BASE_DIR / 'assets'
       Note: you can name any folder in our case we named is "assets"

     STATIC_URL = 'static/'
     MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
     STATIC_ROOT = BASE_DIR / 'assets'

     now we can delete os.path.join   in 
     MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
      and make it look like something this 
      MEDIA_ROOT = BASE_DIR / 'media' 

      and you can also change 

        STATICFILES_DIRS = [
            os.path.join(BASE_DIR, 'static')
        ]

        change this  to 

        STATICFILES_DIRS = [
            BASE_DIR / 'static'
        ]

- The complete change would look something like this 
        STATIC_URL = 'static/'
        MEDIA_URL = 'media/'

        STATIC_ROOT = BASE_DIR / 'assets'
        MEDIA_ROOT = BASE_DIR, 'media'

        STATICFILES_DIRS = [
            BASE_DIR / 'static'
        ]

open up the Terminal window and type 

    python manage.py collectstatic 

    output 
        134 static files copied to 'C:\Users\CICD Student\OneDrive\Desktop\DJangoProject\myproject\assets'.

this will collect all the static asssets and you will see 
it grabs a lot of the static assets for the Django admin 
area that we have been visiting, and we will put them all 
in that assets diregctory 

Now notice that in your project there is a folder created 
called assests and all the files has been copied to it 

notice in the assets folder that there is an admin folder 
an there are a lot of things we didn't create, but they are 
static assets that Django provides, then also it grabbed our CSS
and JS we have provided 

save the changes in our setting file 

Go to the urls.py file 
myproject > urls.py 

- scroll down and just under the last import we want to add one 
    from django.views.static import serve

- and you can comment out 
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

- we also need to add re_path to the follwoing import 
from django.urls import path, include, re_path

    re -> stands for regular expression 

- And also in the urlspatterns you add 
urlpatterns = [
    re_path(r'^media/(?<path>).*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    re_path(r'^static/(?<path>).*)$', serve, {'document_root': settings.STATIC_ROOT}),
]

- re_path(r'^media/(?<path>).*)$ <- This is a regular expression pattern 
 defining for a group one is for the media and the ohter one is 
 for static 

- The whole code looks something like this 
from django.contrib import admin
from django.urls import path, include, re_path
from . import views
from django.conf.urls.static import static 
from django.conf import settings
from django.views.static import serve 

urlpatterns = [
    re_path(r'^media/(?<path>).*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    re_path(r'^static/(?<path>).*)$', serve, {'document_root': settings.STATIC_ROOT}),
    path('admin/', admin.site.urls),
    path('', views.homepage), 
    path('about/',views.about ), 
    path('product/', views.product),
    path('posts/',include('posts.urls') ),
    path('users/',include('users.urls')), 
    # path('notfound/', views.notfound),
]


- The last fix is in users > templates > users > login.html 

- around line 13 
           <form class="form-with-validation" action="/users/login/" method="post">
    action = "/users/login" 
Instead you can use templating language 
    action = "{% url 'users:login' %}"

- Would be same for register.html page 
- Instead of action="/users/register/", we can use 
    action = "{% url 'users:register'  %}"

