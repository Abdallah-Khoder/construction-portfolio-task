from django.contrib import admin
from .models import *


# Inlines: edit the repeating items on the same page as their section
class HeroCounterInline(admin.TabularInline):
    model = HeroCounter
    extra = 1  # one empty row ready to fill


class AboutFeatureInline(admin.TabularInline):
    model = AboutFeature
    extra = 1


class ServiceInline(admin.TabularInline):
    model = Service
    extra = 1


class TrackRecordStatInline(admin.TabularInline):
    model = TrackRecordStat
    extra = 1


@admin.register(HeroSection)
class HeroSectionAdmin(admin.ModelAdmin):
    inlines = [HeroCounterInline]


@admin.register(AboutSection)
class AboutSectionAdmin(admin.ModelAdmin):
    inlines = [AboutFeatureInline]


@admin.register(ServicesSection)
class ServicesSectionAdmin(admin.ModelAdmin):
    inlines = [ServiceInline]


@admin.register(TrackRecordSection)
class TrackRecordSectionAdmin(admin.ModelAdmin):
    inlines = [TrackRecordStatInline]


# Simple models: registered directly
admin.site.register(SiteSettings)
admin.site.register(NavItem)
admin.site.register(ProjectsSection)
admin.site.register(ProjectCategory)
admin.site.register(Project)