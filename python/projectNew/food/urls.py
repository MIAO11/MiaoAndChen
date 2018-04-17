from django.conf.urls import url
from food import views

app_name = 'food'
urlpatterns = [
    url(r'^$', views.home),
    url(r'^fooddetail/(?P<food_id>[0-9]+)$', views.fooddetail,name='fooddetail'),
    url(r'^foodcategory/(?P<food_id>[0-9]+)$', views.fooddetail,name='foodcategory'),
]