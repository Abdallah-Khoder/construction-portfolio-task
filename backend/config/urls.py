from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path

from portfolio.admin_api import admin_router
from portfolio.views import AdminLoginView, AdminPingView, SiteContentView

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/content/", SiteContentView.as_view()),
    path("api/admin/login/", AdminLoginView.as_view()),
    path("api/admin/ping/", AdminPingView.as_view()),
    path("api/admin/", include(admin_router.urls)),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)