<p align='center'>
<img src ="https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png">
<p>

<h1 align='center'>
 <b>PROYECTO INDIVIDUAL Nº2</b>
</h1>

# <h1 align="center">**`Telecomunicaciones`**</h1>

¡En este proyecto se asume el rol de Data Analyst para realizar un análisis completo para reconocer el comportamiento del sector de las telecomunicaciones en Argentina, a solicitud de una empresa prestadora de servicios de telecomunicaciones.

## **Descripción del proyecto**

### **Contexto**
Se nos propone partiendo del rol de Data Analyst, realizar un **análisis** completo que permita atender tres objetivos: 
  1. Orientar a la empresa en brindar una buena calidad de sus servicios.
  2. Identificar oportunidades de crecimiento.
  3. Plantear soluciones personalizadas a sus posibles clientes

Para lo anterior se reciben varios Dataset ofrecidos por el **ENACOM** Ente Nacional de comunicaciones de Argentina. - [Datasets principales](https://indicadores.enacom.gob.ar/datos-abiertos) 

## Estructura del Proyecto
- `Dataset/`: Contiene los archivos de datos utilizados en el proyecto.
- `notebooks/`: Incluye los notebooks de Jupyter (ETL y EDA).
- `sql/`: Incluye el código SQL de la base de datos en postgresql
- `README.md`: Archivo de documentación del proyecto.

## Metodología aplicada
- `Recolección de los datos`:
- Los datos se obtuvieron de los Dataset ofrecidos por el **ENACOM** Ente Nacional de comunicaciones de Argentina. - [Datasets principales](https://indicadores.enacom.gob.ar/datos-abiertos). Se descargan archivos en formato .xlsx. Para el análisis se seleccionan los siguientes archivos, los cuales están relacionados con nuestras variables de interés que son : la población por provincia, acceso a internet discriminado por año y tecnología, cantidad de suscripción TV por cada 100 hogares. 
- mapa_conectividad.xlsx
- Internet.xlsx
- Television.xlsx
- Los demás archivos disponibles se descartan porque no está relacionada con nuestras variables de interés. 
- Las variables a analizar se seleccionan en función del objetivo principal que es orientar a la empresa en brindar una buena calidad del servicio de internet e identificar oportunidades de crecimiento, analizando como opción el servicio de tv por suscripción.  
- `Limpieza de datos`:
- La limpieza de los datos se realiza en el notebook 'ETL.ipynb'. Se realiza preprocesamiento de los datos, verificando y eliminando duplicados, gestionando valores nulos y transformando los datos en un formato adecuado para el análisis.
- `Exploración de datos (EDA)`:
- Se realiza un análisis para entender las características de los datos, iniciando por seleccionar el top 5 de provincias con mayor población, ya que nos ofrecen una mayor probabilidad de clientes potenciales, y sobre estas 5 provincias se analizan otras variables como cantidad de accesos a internet por año y tecnología, accesos a suscripción de TV por cada 100 hogares, accesos a internet por cada 100 hogares. *
  
- `Selección de herramientas y técnicas`:
- *Lenguaje Python y librerias*: Se utilizan las librerias Numpy, pandas, mapplotlib, seaborn, sqlalchemy.
- *Base de datos Postgresql*: Se utiliza Postgresql como motor de base de datos y PgAdmin4 y la terminal de linux como cliente. 
- *Power BI*: Se elabora en Power BI un Dashboard para presentar al cliente los resultados del análisis. 
- *Jupyter*: Se utiliza Jupyter Lab para el desarrollo de los notebook. 

- `Análisis`:
- Se proponen tres KPIS a la empresa que le permitan medir lo siguiente:
  - Aumentar en un 2% el acceso al servicio de internet para el próximo trimestre, cada 100 hogares, por provincia. La fórmula es la siguiente:
    $`KPI = ((Nuevo acceso - Acceso actual) / Acceso actual) * 100`$
  - Aumentar en una meta porcentual establecida particularmente para cada una de las 5 provincias (Buenos Aires, Capital Federal, Córdoba, Mendoza, Santa Fe) para el próximo trimestre, el acceso a internet mediante fibra óptica respecto al total de accesos de todas las tecnologías. La fórmula es la siguiente:
   $`KPI = (acceso Fibra en la provincia / total accesos en la provincia ) - (acceso Fibra en la provincia Trimestre anterior / total accesos en la provincia Trimestre anterior )   `$

## Desarollado por 


