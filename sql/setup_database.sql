-- Crear el usuario
CREATE USER pi2_user WITH PASSWORD '1234';

-- Crear la base de datos
CREATE DATABASE pi2;

-- Dar permisos al usuario sobre la base de datos
GRANT ALL PRIVILEGES ON DATABASE pi2 TO pi2_user;

CREATE TABLE kpi_penetracion_suscripciontv (
    fecha DATE,    
    provincia VARCHAR(255),
    suscripcioncada100hogares FLOAT,
    acceso_anterior FLOAT,    
    kpi FLOAT
);

CREATE TABLE kpi_penetracion_fibraoptica (
    fecha DATE,    
    provincia VARCHAR(255),
    accesos INTEGER,
    acceso_anterior INTEGER,    
    kpi FLOAT
);

CREATE TABLE kpi_meta_penetracion_suscripciontv (     
    provincia VARCHAR(255),      
    kpi_meta FLOAT
);

CREATE TABLE kpi_meta_penetracion_fibraoptica (     
    provincia VARCHAR(255),      
    kpi_meta FLOAT
);

CREATE TABLE top5_provincia (
    provincia VARCHAR(255),    
    poblacion INTEGER,
    porcentaje FLOAT
);

CREATE TABLE accesotecnologiaprovincia (
    ano DATE,
    trimestre INTEGER, 
    provincia VARCHAR(255),
    tecnologia VARCHAR(255),
    accesos INTEGER
);

CREATE TABLE accesoHogaresProvincia (
    fecha DATE,    
    provincia VARCHAR(255),
    accesoscada100hogares FLOAT,
    acceso_anterior FLOAT,    
    kpi FLOAT
);

CREATE TABLE accesoTVsuscripcionProvincia (
    fecha DATE,    
    provincia VARCHAR(255),
    accesosTV_vrf INTEGER
);


CREATE TABLE tvsuscripcionProvincia_habitantes_hogares (
    fecha DATE,    
    provincia VARCHAR(255),
    suscripcioncada100hab FLOAT,
    suscripcioncada100hogares FLOAT
);


DROP TABLE IF EXISTS accesohogaresprovincia;

TRUNCATE TABLE accesohogaresprovincia;




-- Crear vista para calcular el % de aumento de accesos cada trimestre. 

CREATE OR REPLACE VIEW vista_aumento_accesos AS
WITH TotalAccesos AS (
    SELECT 
        fecha,
        SUM(Accesos) AS TotalAccesos
    FROM accesoTecnologiaProvincia
    GROUP BY fecha
)
SELECT 
    fecha,
    TotalAccesos,
    LAG(TotalAccesos) OVER (ORDER BY fecha) AS Accesos_Trimestre_Anterior,
    -- Casting de los valores a numeric para evitar la división entera y asegurar el tipo double precision
    CASE
        WHEN LAG(TotalAccesos) OVER (ORDER BY fecha) IS NULL THEN NULL
        ELSE ((TotalAccesos - LAG(TotalAccesos) OVER (ORDER BY fecha)) / 
              LAG(TotalAccesos) OVER (ORDER BY fecha)::numeric) * 100::double precision
    END AS Porcentaje_Aumento
FROM TotalAccesos;




