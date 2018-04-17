from django.db import models

# Create your models here.
class food(models.Model):
    name = models.CharField(max_length=30)
    detail = models.CharField(max_length=50)
    img = models.CharField(max_length=100)
    def __str__(self):
        return self.name
class menu(models.Model):
    name = models.CharField(max_length=30)
    detail = models.CharField(max_length=50)
    img = models.CharField(max_length=100)
class foodcategory(models.Model):
    name =models.CharField(max_length=30)
    categoryid =models.CharField(max_length=20)
    childid =models.CharField(max_length=30)

