from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
from .serializers import *
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAdminUser


class SiteContentView(APIView):
    """Return all website content in a single JSON response."""

    def get(self, request):
        ctx = {"request": request}  # needed to build full image URLs

        def one(model, serializer_class):
            # Sections have a single row: take the first one (or None if empty)
            obj = model.objects.first()
            return serializer_class(obj, context=ctx).data if obj else None

        return Response({
            "settings": one(SiteSettings, SiteSettingsSerializer),
            "nav": NavItemSerializer(NavItem.objects.all(), many=True).data,
            "hero": one(HeroSection, HeroSerializer),
            "about": one(AboutSection, AboutSerializer),
            "services": one(ServicesSection, ServicesSerializer),
            "track_record": one(TrackRecordSection, TrackRecordSerializer),
            "projects_section": one(ProjectsSection, ProjectsSectionSerializer),
            "categories": ProjectCategorySerializer(ProjectCategory.objects.all(), many=True).data,
            "projects": ProjectSerializer(Project.objects.all(), many=True, context=ctx).data,
        })

class AdminLoginView(APIView):
    """Checks username/password and returns a token for staff users only."""

    def post(self, request):
        user = authenticate(
            username=request.data.get("username"),
            password=request.data.get("password"),
        )
        if user is None or not user.is_staff:
            return Response({"detail": "Invalid username or password"}, status=400)

        token, _ = Token.objects.get_or_create(user=user)
        return Response({"token": token.key})


class AdminPingView(APIView):
    """Protected test endpoint: only works with a valid staff token."""
    permission_classes = [IsAdminUser]

    def get(self, request):
        return Response({"ok": True, "username": request.user.username})