from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
from rest_framework.test import APITestCase

from .models import HeroCounter, HeroSection, Project, ProjectCategory


class AdminApiTests(APITestCase):
    """Checks login, protection and CRUD of the admin API (uses a temporary DB)."""

    def setUp(self):
        self.staff = User.objects.create_user("boss", password="pass1234", is_staff=True)
        self.visitor = User.objects.create_user("visitor", password="pass1234")
        self.hero = HeroSection.objects.create(
            badge_text="Badge", title="Old title", description="Desc", primary_btn_text="Go"
        )

    def login_as_staff(self):
        """Send the staff token with every following request."""
        token = Token.objects.create(user=self.staff)
        self.client.credentials(HTTP_AUTHORIZATION=f"Token {token.key}")

    # ---- login ----
    def test_staff_can_log_in_and_get_token(self):
        res = self.client.post(
            "/api/admin/login/", {"username": "boss", "password": "pass1234"}, format="json"
        )
        self.assertEqual(res.status_code, 200)
        self.assertIn("token", res.data)

    def test_wrong_password_is_rejected(self):
        res = self.client.post(
            "/api/admin/login/", {"username": "boss", "password": "wrong"}, format="json"
        )
        self.assertEqual(res.status_code, 400)

    def test_non_staff_user_cannot_log_in(self):
        res = self.client.post(
            "/api/admin/login/", {"username": "visitor", "password": "pass1234"}, format="json"
        )
        self.assertEqual(res.status_code, 400)

    # ---- protection ----
    def test_admin_api_requires_a_token(self):
        self.assertEqual(self.client.get("/api/admin/hero/").status_code, 401)
        res = self.client.patch(
            f"/api/admin/hero/{self.hero.id}/", {"title": "Hacked"}, format="multipart"
        )
        self.assertEqual(res.status_code, 401)
        self.hero.refresh_from_db()
        self.assertEqual(self.hero.title, "Old title")  # nothing changed

    def test_public_content_needs_no_login(self):
        res = self.client.get("/api/content/")
        self.assertEqual(res.status_code, 200)
        self.assertEqual(res.data["hero"]["title"], "Old title")

    # ---- edit a section ----
    def test_staff_can_edit_hero_and_site_shows_it(self):
        self.login_as_staff()
        res = self.client.patch(
            f"/api/admin/hero/{self.hero.id}/", {"title": "New title"}, format="multipart"
        )
        self.assertEqual(res.status_code, 200)
        self.hero.refresh_from_db()
        self.assertEqual(self.hero.title, "New title")
        self.assertEqual(self.client.get("/api/content/").data["hero"]["title"], "New title")

    def test_empty_required_field_is_rejected(self):
        self.login_as_staff()
        res = self.client.patch(
            f"/api/admin/hero/{self.hero.id}/", {"title": ""}, format="multipart"
        )
        self.assertEqual(res.status_code, 400)
        self.assertIn("title", res.data)

    # ---- add / edit / delete list items ----
    def test_counter_add_edit_delete(self):
        self.login_as_staff()

        # add
        res = self.client.post(
            "/api/admin/hero-counters/",
            {"hero": self.hero.id, "number": "9+", "label": "Test", "order": 1},
            format="multipart",
        )
        self.assertEqual(res.status_code, 201)
        counter_id = res.data["id"]
        counters = self.client.get("/api/content/").data["hero"]["counters"]
        self.assertEqual(counters[0]["label"], "Test")

        # edit
        res = self.client.patch(
            f"/api/admin/hero-counters/{counter_id}/", {"label": "Edited"}, format="multipart"
        )
        self.assertEqual(res.status_code, 200)
        self.assertEqual(HeroCounter.objects.get(id=counter_id).label, "Edited")

        # delete
        res = self.client.delete(f"/api/admin/hero-counters/{counter_id}/")
        self.assertEqual(res.status_code, 204)
        self.assertEqual(HeroCounter.objects.count(), 0)

    def test_project_can_move_to_another_category(self):
        self.login_as_staff()
        res = self.client.post(
            "/api/admin/categories/",
            {"name": "Industrial", "slug": "industrial"},
            format="multipart",
        )
        self.assertEqual(res.status_code, 201)

        old = ProjectCategory.objects.create(name="Old", slug="old")
        project = Project.objects.create(category=old, title="P", description="D")

        res = self.client.patch(
            f"/api/admin/projects/{project.id}/",
            {"category": res.data["id"]},
            format="multipart",
        )
        self.assertEqual(res.status_code, 200)
        project.refresh_from_db()
        self.assertEqual(project.category.slug, "industrial")