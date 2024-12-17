from django.http import HttpResponse
from django.shortcuts import render 
# Your python code goes here 

def homepage(request):
    #return HttpResponse ("This is home , am home!!!")
    return render(request, 'home.html')
def about(request): 
   # return HttpResponse("My about page")
    return render(request, 'about.html')

# def product(request): 
#      return HttpResponse( "This is product page")

# def notfound(request): 
#     return HttpResponse("Page Not Found")

def product(request):
    return render(request, 'product.html')

def register(request): 
    return render(request, 'register.html')








