# Portal GEODATA INSIGHTS (GeoNode)

Portal + catálogo de la plataforma. Equivalente a **ArcGIS Portal / ArcGIS Online**.

Basado en [geonode-project](https://github.com/GeoNode/geonode-project) (plantilla oficial para personalizar GeoNode con marca propia).

## Qué incluye (servicios orquestados)

| Servicio | Rol |
|---|---|
| `django` (GeoNode) | Portal web: capas, mapas, documentos, usuarios, grupos, permisos |
| `nginx` | Proxy inverso en el puerto 80 |
| `geoserver` | GeoServer de GeoNode (publica las capas del portal) |
| `db` | PostGIS interno (metadatos + capas del portal) |
| `celery` + `rabbitmq` | Tareas asíncronas (carga de capas, thumbnails) |
| `memcached` | Caché |
| `data4sea` | Volúmenes compartidos de datos |

## Operación

```bash
cd portal/geonode-project
docker compose up -d        # levantar
docker compose logs -f django   # ver arranque del portal
docker compose down         # detener
```

Acceso: http://localhost:8084 — usuario `admin` / contraseña en `.env` (`ADMIN_PASSWORD`).

> El `.env` ya está generado (`HTTP_PORT=8084`, `SITEURL=http://localhost:8084/`, contraseñas aleatorias seguras). Para regenerarlo: `python create-envfile.py --noinput --hostname localhost` y luego ajustar el puerto.
>
> **Importante (Windows):** los scripts `*.sh` y `celery-cmd` ya fueron convertidos a fin de línea `LF`. Si recreas el clone, vuelve a convertirlos o los contenedores Django/Celery fallarán (`$'bash\r': No such file or directory`).

## Personalización de marca

**Branding automatizado** (ya aplicado): `../scripts/portal/` contiene el logo y `aplicar_marca.py`; se re-ejecuta tras cualquier reinstalación:

```powershell
docker cp ../scripts/portal/gdi_logo.svg django4geonode_project:/mnt/volumes/statics/uploaded/img/geodata-insights-logo.svg
Get-Content ../scripts/portal/aplicar_marca.py | docker exec -i django4geonode_project python manage.py shell
```

Personalización fina desde la UI: `/admin/geonode_themes/geonodethemecustomization/` (logo, CSS, textos de bienvenida).


- Código Python (settings, tema): `src/geonode_project/`
- Configuración: `.env` (nunca versionar)
- Logo, colores y nombre del sitio: desde el admin de Django (`/admin/`, sección *Themes*) — recomendado para la marca **GEODATA INSIGHTS** sin tocar código.

## Conexión con el núcleo

Los **datos de negocio** viven en el PostGIS del núcleo (`../docker-compose.yml`, puerto 5432). Para servirlos por el portal:

1. Publicar la capa en el GeoServer del núcleo (puerto 8082).
2. En GeoNode: *Admin → WMS Services* (harvest) apuntando a `http://host.docker.internal:8082/geoserver/wms`, o registrar como *Remote Service*.
3. Alternativa avanzada: configurar el GeoServer del núcleo como una capa redundante y migrar los datos al GeoServer del portal para aprovechar su integración de metadatos.
