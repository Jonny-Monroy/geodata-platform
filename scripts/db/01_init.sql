-- GEODATA INSIGHTS - Inicialización de la base espacial
-- Equivalente al "ArcGIS Data Store" relacional

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;
CREATE EXTENSION IF NOT EXISTS pgrouting;

-- Esquema de datos de negocio (separado del catálogo del portal)
CREATE SCHEMA IF NOT EXISTS geodata;
-- Esquema para staging/etl (cargas crudas antes de migrar a producción)
CREATE SCHEMA IF NOT EXISTS staging;
