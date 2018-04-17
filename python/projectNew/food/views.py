from django.shortcuts import render
from . import models
from rest_framework import viewsets
from django.contrib.auth.models import User, Group
from food.serializers import UserSerializer, GroupSerializer,FoodSerializer,FoodCategorySerializer
from food.models import food
from food.models import foodcategory

# Create your views here.
def home(request):
    foods=models.food.objects.all()
    return render(request, 'home.html', {'foods': foods})

def fooddetail(request,food_id):
    food=models.food.objects.get(pk=food_id)
    return render(request,'fooddetail.html',{'food':food})

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

class FoodViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = food.objects.all()
    serializer_class = FoodSerializer

class FoodCategoryViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = foodcategory.objects.all()
    serializer_class = FoodCategorySerializer


