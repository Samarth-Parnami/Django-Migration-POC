from django.db import models

# Create your models here.

class MyModel(models.Model):
    name = models.CharField(max_length=10)
    test_field = models.BooleanField(default=False, null=False, blank=False)
