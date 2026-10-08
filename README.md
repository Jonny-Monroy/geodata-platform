# GEODATA INSIGHTS Platform

Plataforma geoespacial empresarial open-source — equivalente funcional de ArcGIS Enterprise.

## Componentes

- **PostGIS** — almacén de datos espaciales (≈ ArcGIS Data Store)
- **GeoServer** — servicios OGC WMS/WFS/WCS (≈ ArcGIS Server)
- **GeoNode + MapStore** — portal, catálogo y visor web (`portal/`) (≈ ArcGIS Portal / Online)
- **QGIS** — editor de escritorio recomendado (≈ ArcGIS Pro)

Arquitectura completa y roadmap: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

## Inicio rápido

```bash
cp .env.example .env        # ajustar contraseñas
docker compose up -d        # núcleo: PostGIS + GeoServer
```

Para el portal GeoNode ver [portal/README](portal/README.md).

## Accesos

| Servicio | URL |
|---|---|
| Portal GeoNode | http://localhost:8084 |
| GeoServer (núcleo) | http://localhost:8085/geoserver |
| PostGIS (núcleo) | localhost:5434 |
