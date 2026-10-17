# Aplica la marca GEODATA INSIGHTS al portal GeoNode.
# Uso (con el stack del portal corriendo):
#   docker cp gdi_logo.svg django4geonode_project:/mnt/volumes/statics/uploaded/img/geodata-insights-logo.svg
#   Get-Content aplicar_marca.py | docker exec -i django4geonode_project python manage.py shell
from geonode.themes.models import GeoNodeThemeCustomization
from django.contrib.sites.models import Site

BRAND_CSS = (
    ".gn-brand-navbar,.gn-main-header{background:#0E4D64 !important;}"
    ".gn-main-header .dropdown-toggle{color:#fff !important;}"
    "a{color:#0E4D64;}"
    ".btn-primary,.btn-primary:focus{background:#1B9E77 !important;border-color:#1B9E77 !important;}"
    ".btn-primary:hover{background:#157f5f !important;}"
    ".jumbotron,.gn-home-jumbotron{background:linear-gradient(120deg,#0E4D64 0%,#146B5D 100%) !important;color:#fff !important;}"
    ".gn-footer{background:#0A2E3D !important;color:#cfd8dc !important;}"
    ".gn-card{border-top:3px solid #1B9E77;}"
)

theme, _ = GeoNodeThemeCustomization.objects.update_or_create(
    name="GEODATA INSIGHTS",
    defaults=dict(
        is_enabled=True,
        description="Tema corporativo GEODATA INSIGHTS",
        logo="img/geodata-insights-logo.svg",
        extra_css=BRAND_CSS,
        jumbotron_welcome_title="GEODATA INSIGHTS",
        jumbotron_welcome_content=(
            "Plataforma geoespacial empresarial: cataloga, publica "
            "y comparte tus datos geograficos."
        ),
    ),
)
GeoNodeThemeCustomization.objects.exclude(pk=theme.pk).update(is_enabled=False)

site = Site.objects.get_current()
site.name = "GEODATA INSIGHTS"
site.domain = "localhost:8084"  # ajustar al dominio del cliente
site.save()

print("Marca aplicada:", theme.name, "| sitio:", site.name)
