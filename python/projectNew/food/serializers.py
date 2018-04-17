from django.contrib.auth.models import User, Group
from rest_framework import serializers
from food.models import food
from food.models import foodcategory


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')

class FoodSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model=food
        fields=('name','detail','img')

class FoodCategorySerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model=foodcategory
        fields=('name','categoryid','childid')
