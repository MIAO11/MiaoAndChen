# Generated by Django 2.0.3 on 2018-04-17 10:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('food', '0003_foodcategory'),
    ]

    operations = [
        migrations.RenameField(
            model_name='foodcategory',
            old_name='categoryId',
            new_name='categoryid',
        ),
        migrations.RenameField(
            model_name='foodcategory',
            old_name='childId',
            new_name='childid',
        ),
    ]