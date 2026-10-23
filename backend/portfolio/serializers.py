from rest_framework import serializers
from .models import (
    SiteSettings, NavItem, HeroSection, HeroCounter, AboutSection, AboutFeature,
    ServicesSection, Service, TrackRecordSection, TrackRecordStat,
    ProjectsSection, ProjectCategory, Project,
)

# A serializer converts a model into JSON.
# "fields" lists exactly what is sent to the frontend.


class SiteSettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = SiteSettings
        fields = ["brand_name", "phone", "cta_button_text"]


class NavItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = NavItem
        fields = ["label", "anchor"]


class HeroCounterSerializer(serializers.ModelSerializer):
    class Meta:
        model = HeroCounter
        fields = ["number", "label"]


class HeroSerializer(serializers.ModelSerializer):
    # Nested: the hero comes with its own counters
    counters = HeroCounterSerializer(many=True, read_only=True)

    class Meta:
        model = HeroSection
        fields = ["badge_text", "title", "highlight_word", "description",
                  "background_image", "primary_btn_text", "secondary_btn_text", "counters"]


class AboutFeatureSerializer(serializers.ModelSerializer):
    class Meta:
        model = AboutFeature
        fields = ["icon", "title", "description"]


class AboutSerializer(serializers.ModelSerializer):
    features = AboutFeatureSerializer(many=True, read_only=True)

    class Meta:
        model = AboutSection
        fields = ["small_heading", "title", "description", "image_main", "image_secondary",
                  "badge_number", "badge_label", "btn1_text", "btn2_text", "features"]


class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = ["icon", "title", "description"]


class ServicesSerializer(serializers.ModelSerializer):
    services = ServiceSerializer(many=True, read_only=True)

    class Meta:
        model = ServicesSection
        fields = ["title", "subtitle", "side_image", "cta_title", "cta_link_text", "services"]


class TrackRecordStatSerializer(serializers.ModelSerializer):
    class Meta:
        model = TrackRecordStat
        fields = ["icon", "number", "label"]


class TrackRecordSerializer(serializers.ModelSerializer):
    stats = TrackRecordStatSerializer(many=True, read_only=True)

    class Meta:
        model = TrackRecordSection
        fields = ["small_heading", "title", "description", "link_text", "stats"]


class ProjectsSectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProjectsSection
        fields = ["title", "subtitle"]


class ProjectCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = ProjectCategory
        fields = ["name", "slug"]


class ProjectSerializer(serializers.ModelSerializer):
    # Send the category slug (used by the filter) and its display name
    category = serializers.SlugRelatedField(slug_field="slug", read_only=True)
    category_name = serializers.CharField(source="category.name", read_only=True)

    class Meta:
        model = Project
        fields = ["title", "description", "image", "category", "category_name"]