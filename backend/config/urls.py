from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from portfolio.views import SiteContentView

urlpatterns = [
    path("admin/", admin.site.urls),                  # Django admin panel
    path("api/content/", SiteContentView.as_view()),  # JSON API used by React
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)  # serve uploaded images (dev only)