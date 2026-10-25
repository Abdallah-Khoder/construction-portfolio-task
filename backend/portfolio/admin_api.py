from rest_framework import routers, serializers, viewsets
from rest_framework.permissions import IsAdminUser

from . import models


def build_viewset(model_class):
    """Create a serializer + a protected CRUD viewset for any model."""

    class AdminSerializer(serializers.ModelSerializer):
        class Meta:
            model = model_class
            fields = "__all__"  # every field, so the admin panel can edit all

    class AdminViewSet(viewsets.ModelViewSet):
        queryset = model_class.objects.all()
        serializer_class = AdminSerializer
        permission_classes = [IsAdminUser]  # staff token required

    return AdminViewSet


# One URL per model: /api/admin/<name>/ and /api/admin/<name>/<id>/
admin_router = routers.SimpleRouter()

RESOURCES = {
    "settings": models.SiteSettings,
    "nav": models.NavItem,
    "hero": models.HeroSection,
    "hero-counters": models.HeroCounter,
    "about": models.AboutSection,
    "about-features": models.AboutFeature,
    "services-section": models.ServicesSection,
    "services": models.Service,
    "track-record": models.TrackRecordSection,
    "track-record-stats": models.TrackRecordStat,
    "projects-section": models.ProjectsSection,
    "categories": models.ProjectCategory,
    "projects": models.Project,
}

for name, model_class in RESOURCES.items():
    admin_router.register(name, build_viewset(model_class), basename=f"admin-{name}")