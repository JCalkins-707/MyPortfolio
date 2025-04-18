from django.contrib import admin
from .models import *
from django.contrib import admin


@admin.register(Artist)
class AuthorAdmin(admin.ModelAdmin):
    pass


@admin.register(Artwork)
class AuthorAdmin(admin.ModelAdmin):
    pass


@admin.register(FlatFile)
class AuthorAdmin(admin.ModelAdmin):
    pass


@admin.register(Rack)
class AuthorAdmin(admin.ModelAdmin):
    pass


@admin.register(Sale)
class AuthorAdmin(admin.ModelAdmin):
    pass


@admin.register(Storage)
class AuthorAdmin(admin.ModelAdmin):
    pass


@admin.register(WallSpace)
class AuthorAdmin(admin.ModelAdmin):
    pass


