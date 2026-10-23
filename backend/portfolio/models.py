from django.db import models

# Rule used in this file:
# - One table per section (a single row of content)
# - A separate table for each repeating list, linked with a ForeignKey


# ---------- General (navbar) ----------
class SiteSettings(models.Model):
    brand_name = models.CharField(max_length=100)
    phone = models.CharField(max_length=30)
    cta_button_text = models.CharField(max_length=50, default="Get Estimate")

    def __str__(self):
        return self.brand_name


class NavItem(models.Model):
    label = models.CharField(max_length=50)
    anchor = models.CharField(max_length=100, help_text="e.g. #home")
    order = models.PositiveIntegerField(default=0)  # controls display order

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return self.label


# ---------- Home ----------
class HeroSection(models.Model):
    badge_text = models.CharField(max_length=150)
    title = models.CharField(max_length=200)
    highlight_word = models.CharField(max_length=50, blank=True)  # shown in orange
    description = models.TextField()
    background_image = models.ImageField(upload_to="hero/")
    primary_btn_text = models.CharField(max_length=50)
    secondary_btn_text = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return self.title


class HeroCounter(models.Model):
    # related_name lets us write hero.counters.all()
    hero = models.ForeignKey(HeroSection, on_delete=models.CASCADE, related_name="counters")
    number = models.CharField(max_length=20)  # text, because of values like "25+"
    label = models.CharField(max_length=100)
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.number} {self.label}"


# ---------- About ----------
class AboutSection(models.Model):
    small_heading = models.CharField(max_length=100)
    title = models.CharField(max_length=200)
    description = models.TextField()
    image_main = models.ImageField(upload_to="about/")
    image_secondary = models.ImageField(upload_to="about/", blank=True)
    badge_number = models.CharField(max_length=20)
    badge_label = models.CharField(max_length=50)
    btn1_text = models.CharField(max_length=50, blank=True)
    btn2_text = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return self.title


class AboutFeature(models.Model):
    about = models.ForeignKey(AboutSection, on_delete=models.CASCADE, related_name="features")
    icon = models.CharField(max_length=50, help_text="e.g. bi-shield-check")  # Bootstrap icon class
    title = models.CharField(max_length=100)
    description = models.TextField()
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return self.title


# ---------- Services ----------
class ServicesSection(models.Model):
    title = models.CharField(max_length=150)
    subtitle = models.TextField()
    side_image = models.ImageField(upload_to="services/")
    cta_title = models.CharField(max_length=200)
    cta_link_text = models.CharField(max_length=100)

    def __str__(self):
        return self.title


class Service(models.Model):
    section = models.ForeignKey(ServicesSection, on_delete=models.CASCADE, related_name="services")
    icon = models.CharField(max_length=50)
    title = models.CharField(max_length=100)
    description = models.TextField()
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return self.title


class TrackRecordSection(models.Model):
    small_heading = models.CharField(max_length=100)
    title = models.CharField(max_length=200)
    description = models.TextField()
    link_text = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return self.title


class TrackRecordStat(models.Model):
    section = models.ForeignKey(TrackRecordSection, on_delete=models.CASCADE, related_name="stats")
    icon = models.CharField(max_length=50)
    number = models.CharField(max_length=20)
    label = models.CharField(max_length=100)
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return f"{self.number} {self.label}"


# ---------- Projects ----------
class ProjectsSection(models.Model):
    title = models.CharField(max_length=150)
    subtitle = models.TextField()

    def __str__(self):
        return self.title


class ProjectCategory(models.Model):
    # Used for the filter buttons (All / Residential / Commercial / ...)
    name = models.CharField(max_length=50)
    slug = models.SlugField(unique=True)

    class Meta:
        verbose_name_plural = "Project categories"

    def __str__(self):
        return self.name


class Project(models.Model):
    # Each project belongs to one category (avoids typing the name every time)
    category = models.ForeignKey(ProjectCategory, on_delete=models.CASCADE, related_name="projects")
    title = models.CharField(max_length=150)
    description = models.TextField()
    image = models.ImageField(upload_to="projects/")
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return self.title