"""
URL configuration for myproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
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

# Tip you can press Alt + z, to wrap a long line code 
# urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

